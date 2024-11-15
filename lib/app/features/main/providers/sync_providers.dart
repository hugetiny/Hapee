import 'package:hapee/app/features/main/providers/error_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../gopeed_api/api.dart';
import '../model/gopeed_models/common/models.dart';

part 'sync_providers.g.dart';



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
      ref.read(errorLogNotifierProvider.notifier).add(
        'tasks',
        result.msg ?? 'Unknown error',
        StackTrace.current,
      );
      yield [];
      continue;
    }

    yield result.getTaskList();
    await Future.delayed(const Duration(seconds: 10));
  }
}

/// 创建任务
@riverpod
Future<void> createTask(Ref ref, CreateTask task) async {
  final result = await Api.taskApi.createTask(task);
  if (!result.isSuccess) {
    ref.read(errorLogNotifierProvider.notifier).add(
      'createTask',
      result.msg ?? 'Unknown error',
      StackTrace.current,
    );
  }
}

/// 批量创建任务
@riverpod
Future<void> createTaskBatch(Ref ref, CreateTaskBatch batch) async {
  final result = await Api.taskApi.createTaskBatch(batch);
  if (!result.isSuccess) {
    ref.read(errorLogNotifierProvider.notifier).add(
      'createTaskBatch',
      result.msg ?? 'Unknown error',
      StackTrace.current,
    );
  }
}

/// 暂停任务
@riverpod
Future<void> pauseTask(Ref ref, String id) async {
  final result = await Api.taskApi.pauseTask(id);
  if (!result.isSuccess) {
    ref.read(errorLogNotifierProvider.notifier).add(
      'pauseTask',
      result.msg ?? 'Unknown error',
      StackTrace.current,
    );
  }
}

/// 批量暂停任务
@riverpod
Future<void> pauseTasks(
  Ref ref, {
  List<String>? ids,
  List<Status>? statuses,
  List<Status>? notStatuses,
}) async {
  final result = await Api.taskApi.pauseTasks(
    ids: ids,
    statuses: statuses,
    notStatuses: notStatuses,
  );
  if (!result.isSuccess) {
    ref.read(errorLogNotifierProvider.notifier).add(
      'pauseTasks',
      result.msg ?? 'Unknown error',
      StackTrace.current,
    );
  }
}

/// 继续任务
@riverpod
Future<void> continueTask(Ref ref, String id) async {
  final result = await Api.taskApi.continueTask(id);
  if (!result.isSuccess) {
    ref.read(errorLogNotifierProvider.notifier).add(
      'continueTask',
      result.msg ?? 'Unknown error',
      StackTrace.current,
    );
  }
}

/// 批量继续任务
@riverpod
Future<void> continueTasks(
  Ref ref, {
  List<Status>? statuses,
}) async {
  final result = await Api.taskApi.continueTasks(statuses: statuses);
  if (!result.isSuccess) {
    ref.read(errorLogNotifierProvider.notifier).add(
      'continueTasks',
      result.msg ?? 'Unknown error',
      StackTrace.current,
    );
  }
}

/// 删除任务
@riverpod
Future<void> deleteTask(Ref ref, String id, bool force) async {
  final result = await Api.taskApi.deleteTask(id, force);
  if (!result.isSuccess) {
    ref.read(errorLogNotifierProvider.notifier).add(
      'deleteTask',
      result.msg ?? 'Unknown error',
      StackTrace.current,
    );
  }
}

/// 批量删除任务
@riverpod
Future<void> deleteTasks(
  Ref ref, {
  List<String>? ids,
  List<Status>? statuses,
  List<Status>? notStatuses,
  bool force = false,
}) async {
  final result = await Api.taskApi.deleteTasks(
    ids: ids,
    statuses: statuses,
    notStatuses: notStatuses,
    force: force,
  );
  if (!result.isSuccess) {
    ref.read(errorLogNotifierProvider.notifier).add(
      'deleteTasks',
      result.msg ?? 'Unknown error',
      StackTrace.current,
    );
  }
}
