import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../gopeed_api/api.dart';
import '../../../core/models/gopeed_models/common/models.dart';

part 'sync_providers.g.dart';

/// 视图模式
enum ViewMode { grid, table }

/// 任务操作类型
enum TaskOperation { delete, pause, continue_ }

@riverpod
class ViewModeNotifier extends _$ViewModeNotifier {
  @override
  ViewMode build() => ViewMode.grid;

  void toggle() {
    state = state == ViewMode.grid ? ViewMode.table : ViewMode.grid;
  }
}

/// 任务列表状态
@riverpod
Stream<List<Task>> tasks(Ref ref) async* {
  while (true) {
    final result = await Api.taskApi.getTasks([
      Status.running,
      Status.wait,
      Status.pause,
      Status.done,
      Status.error,
    ]);

    if (!result.isSuccess) {
      yield [];
      await Future.delayed(const Duration(seconds: 5)); // 错误后延长重试时间
      continue;
    }

    yield result.getTaskList();
    await Future.delayed(const Duration(seconds: 1));
  }
}

/// 搜索查询
@riverpod
class SearchQueryNotifier extends _$SearchQueryNotifier {
  @override
  String build() => '';

  void update(String query) {
    state = query;
  }
}

/// 过滤后的任务列表
@riverpod
List<Task> filteredTasks(Ref ref) {
  final tasks = ref.watch(tasksProvider).value ?? [];
  final query = ref.watch(searchQueryNotifierProvider).toLowerCase();

  if (query.isEmpty) {
    return tasks;
  }

  return tasks.where((task) {
    return task.displayName.toLowerCase().contains(query);
  }).toList();
}

/// 批量操作任务选择状态
@riverpod
class BatchTaskOperationNotifier extends _$BatchTaskOperationNotifier {
  @override
  Set<String> build() => {};

  bool get isNotEmpty => state.isNotEmpty;

  bool contains(String taskId) => state.contains(taskId);

  void toggleTask(String taskId) {
    if (state.contains(taskId)) {
      state = Set.from(state)..remove(taskId);
    } else {
      state = Set.from(state)..add(taskId);
    }
  }

  void selectAll(List<Task> tasks) {
    state = tasks.map((e) => e.id).toSet();
  }

  void clearSelection() {
    state = {};
  }
}

/// 处理任务操作的基础方法
Future<void> _handleTaskOperation(
  TaskOperation operation,
  List<String> taskIds,
  Ref ref, {
  bool force = false,
}) async {
  if (taskIds.isEmpty) return;

  Result<Map<String, dynamic>> result;
  
  switch (operation) {
    case TaskOperation.delete:
      result = await Api.taskApi.deleteTasks(ids: taskIds, force: force);
      break;
    case TaskOperation.pause:
      result = await Api.taskApi.pauseTasks(ids: taskIds);
      break;
    case TaskOperation.continue_:
      result = await Api.taskApi.continueTasks(ids: taskIds);
      break;
  }

  ref.invalidate(tasksProvider);
}

/// 批量任务操作
@riverpod
Future<void> batchTaskOperation(
  Ref ref,
  TaskOperation operation, {
  bool force = false,
}) async {
  final selectedTasks = ref.read(batchTaskOperationNotifierProvider);
  await _handleTaskOperation(
    operation,
    selectedTasks.toList(),
    ref,
    force: force,
  );
}

/// 单个任务操作
@riverpod
Future<void> taskOperation(
  Ref ref,
  String taskId,
  TaskOperation operation, {
  bool force = false,
}) async {
  await _handleTaskOperation(
    operation,
    [taskId],
    ref,
    force: force,
  );
}

/// 批量创建任务
@riverpod
Future<void> batchCreateTasks(Ref ref, CreateTaskBatch batch) async {
  final result = await Api.taskApi.createTaskBatch(batch);
  ref.invalidate(tasksProvider);
}
