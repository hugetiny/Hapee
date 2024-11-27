// ignore_for_file: invalid_annotation_target

import 'package:dio/dio.dart';
import 'package:hapee/app/core/api/gopeed_api/exceptions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/models/gopeed_models/common/models.dart';
import 'package:hapee/app/core/api/gopeed_api/endpoints/resolve_api.dart';
import '../../../core/api/gopeed_api/endpoints/task_api.dart';

part 'create_task_provider.freezed.dart';
part 'create_task_provider.g.dart';

@freezed
class CreateTaskState with _$CreateTaskState {
  const factory CreateTaskState({
    @Default({}) Map<String, List<String>> selectedFiles,
    @Default({}) Map<String, Resource> resolvedResources,
    @Default('') String filterText,
    @Default({}) Set<String> activeFilters,
  }) = _CreateTaskState;

  const CreateTaskState._();

  // Get total size of selected files
  int get totalSelectedSize {
    int size = 0;
    for (final entry in resolvedResources.entries) {
      final selectedPaths = selectedFiles[entry.key] ?? [];
      size += entry.value.files
          .where((file) => selectedPaths.contains('${file.path}/${file.name}'))
          .fold(0, (sum, file) => sum + file.size);
    }
    return size;
  }

  // Get total size of all resolved files
  int get totalSize {
    return resolvedResources.values.fold(
      0,
      (sum, resource) => sum + resource.size,
    );
  }

  // Get count of selected files
  int get selectedFileCount {
    int count = 0;
    for (final selectedPaths in selectedFiles.values) {
      count += selectedPaths.length;
    }
    return count;
  }

  bool matchesActiveFilters(String path) {
    if (activeFilters.isEmpty) return true;
    return activeFilters.any((filter) =>
        path.toLowerCase().endsWith(filter.toLowerCase()));
  }
}

@riverpod
class CreateTask extends _$CreateTask {
  @override
  CreateTaskState build() => const CreateTaskState();

  void reset() {
    state = const CreateTaskState();
  }

  void updateFilterText(String text) {
    state = state.copyWith(filterText: text);
  }

  void toggleFilter(String extension, String url) {
    final filters = Set<String>.from(state.activeFilters);
    if (!filters.remove(extension)) {
      filters.add(extension);
    }
    state = state.copyWith(activeFilters: filters);
  }

  void selectFilteredFiles(String url, bool select) {
    final resource = state.resolvedResources[url];
    if (resource == null) return;

    final allFilePaths = resource.files
        .map((f) => '${f.path}/${f.name}')
        .where((path) => state.matchesActiveFilters(path))
        .toList();

    final currentSelected = state.selectedFiles[url] ?? [];
    final newSelectedFiles = select
        ? {...currentSelected, ...allFilePaths}.toList()
        : currentSelected
            .where((path) => !state.matchesActiveFilters(path))
            .toList();

    updateSelectedFiles(url, newSelectedFiles);
  }

  void addCustomFilter(String url) {
    if (state.filterText.isEmpty) return;
    final extension = state.filterText.startsWith('.')
        ? state.filterText
        : '.${state.filterText}';
    toggleFilter(extension, url);
    state = state.copyWith(filterText: '');
  }

  void toggleSelectFile(String url, String path) {
    final currentSelected = state.selectedFiles[url] ?? [];
    final newSelected = currentSelected.contains(path)
        ? currentSelected.where((p) => p != path).toList()
        : [...currentSelected, path];

    updateSelectedFiles(url, newSelected);
  }

  void toggleAllFiles(String url, bool selected) {
    final resource = state.resolvedResources[url];
    if (resource == null) return;

    final allFilePaths = resource.files.map((f) => '${f.path}/${f.name}').toList();
    
    // Keep currently selected files that don't match the filter
    final currentSelected = state.selectedFiles[url] ?? [];
    final newSelectedFiles = selected
        ? [
            // Keep files that don't match the filter but were already selected
            ...currentSelected.where((path) => 
              state.filterText.isNotEmpty && 
              !path.toLowerCase().endsWith(state.filterText.toLowerCase())),
            // Add files that match the filter
            ...allFilePaths.where((path) =>
              state.filterText.isEmpty ||
              path.toLowerCase().endsWith(state.filterText.toLowerCase())),
          ]
        : currentSelected.where((path) =>
            state.filterText.isNotEmpty &&
            !path.toLowerCase().endsWith(state.filterText.toLowerCase())).toList();

    updateSelectedFiles(url, newSelectedFiles);
  }

  void updateSelectedFiles(String url, List<String> newSelectedFiles) {
    state = state.copyWith(
      selectedFiles: {
        ...state.selectedFiles,
        url: newSelectedFiles,
      },
    );
  }
}

@riverpod
Future<Resource> resolveUrl(
  Ref ref,
  String url,
) async {
  if (url.trim().isEmpty) {
    throw const ApiResponseException(400, 'URL cannot be empty');
  }

  final resolveApi = ResolveApi();
  final request = Request(
    url: url,
    extra: {},
  );

  final result = await resolveApi.resolve(request);

  // Auto select all files
  final notifier = ref.read(createTaskProvider.notifier);
  notifier.updateSelectedFiles(
    url,
    result.res.files.map((f) => '${f.path}/${f.name}').toList(),
  );

  return result.res;
}

@riverpod
Future<void> createTaskBatch(
  Ref ref,
  CreateTaskBatch batch,
) async {
  if (batch.reqs.isEmpty) {
    throw const ApiResponseException(400, 'No tasks to create');
  }

  final taskApi = TaskApi();
  await taskApi.createTaskBatch(batch);

  // Reset the create task state after successful creation
  ref.read(createTaskProvider.notifier).reset();
}
