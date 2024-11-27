// Flutter imports:
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hapee/app/core/utils/util.dart';
import 'package:hapee/l10n/l10n.dart';

import '../provider/create_task_provider.dart';
import '../../../core/models/gopeed_models/common/models.dart';
import 'resolved_bt_tree_view.dart';

class ResolvedResourceDialog extends ConsumerWidget {
  const ResolvedResourceDialog({
    super.key,
    required this.url,
    required this.resource,
  });

  final String url;
  final Resource resource;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createState = ref.watch(createTaskProvider);
    final selectedFiles = createState.selectedFiles[url] ?? [];
    final filterText = createState.filterText;

    // Calculate selected size
    final selectedSize = selectedFiles.fold<int>(0, (total, path) {
      final file =
          resource.files.firstWhere((f) => '${f.path}/${f.name}' == path);
      return total + file.size;
    });

    // Analyze file extensions and their total sizes
    final Map<String, int> extensionSizes = {};
    for (final file in resource.files) {
      final extension = '.${file.name.split('.').last.toLowerCase()}';
      extensionSizes.update(
        extension,
        (value) => value + file.size,
        ifAbsent: () => file.size,
      );
    }

    // Sort extensions by total size and get top 5
    final commonExtensions = extensionSizes.entries
        .toList()
        ..sort((a, b) => b.value.compareTo(a.value));
    final topExtensions = commonExtensions
        .take(5)
        .map((e) => e.key)
        .toList();

    return AlertDialog(
      title:
          Text(resource.name.isNotEmpty ? resource.name : 'Resolved Resource'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // URL and basic info
            Text('URL: $url'),
            const SizedBox(height: 8),
            Text('Selected Size: ${Util.formatBytes(selectedSize)}'),
            Text('Total Size: ${Util.formatBytes(resource.size)}'),
            const SizedBox(height: 8),

            // File type filter
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    // Common file extensions based on size
                    for (final ext in topExtensions)
                      FilterChip(
                        label: Text('$ext (${Util.formatBytes(extensionSizes[ext]!)})',),
                        selected: ref.watch(createTaskProvider).activeFilters.contains(ext),
                        onSelected: (selected) {
                          final notifier = ref.read(createTaskProvider.notifier);
                          notifier.toggleFilter(ext, url);
                          notifier.selectFilteredFiles(url, selected);
                        },
                      ),
                    // Custom filter input
                    SizedBox(
                      width: 120,
                      child: TextField(
                        controller: TextEditingController(
                          text: ref.watch(createTaskProvider).filterText,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Custom ext...',
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        ),
                        onChanged: (value) => ref
                            .read(createTaskProvider.notifier)
                            .updateFilterText(value),
                        onSubmitted: (_) {
                          final notifier = ref.read(createTaskProvider.notifier);
                          notifier.addCustomFilter(url);
                          notifier.selectFilteredFiles(url, true);
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        final notifier = ref.read(createTaskProvider.notifier);
                        notifier.addCustomFilter(url);
                        notifier.selectFilteredFiles(url, true);
                      },
                    ),
                    // Custom filter input
                    SizedBox(
                      width: 120,
                      child: TextField(
                        controller: TextEditingController(
                          text: ref.watch(createTaskProvider).filterText,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Custom ext...',
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        ),
                        onChanged: (value) => ref
                            .read(createTaskProvider.notifier)
                            .updateFilterText(value),
                        onSubmitted: (_) =>
                            ref.read(createTaskProvider.notifier).addCustomFilter(url),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () =>
                          ref.read(createTaskProvider.notifier).addCustomFilter(url),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        final allFilePaths = resource.files
                            .map((f) => '${f.path}/${f.name}')
                            .toList();
                        ref
                            .read(createTaskProvider.notifier)
                            .updateSelectedFiles(url, allFilePaths);
                      },
                      child: const Text('Select All'),
                    ),
                    TextButton(
                      onPressed: () {
                        ref
                            .read(createTaskProvider.notifier)
                            .updateSelectedFiles(url, []);
                      },
                      child: const Text('Deselect All'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),

            // File tree
            Expanded(
              child: ResolvedBTTreeView(
                resource: resource,
                url: url,
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Create Task'),
        ),
      ],
    );
  }
}
