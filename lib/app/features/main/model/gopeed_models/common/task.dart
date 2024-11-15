import 'package:freezed_annotation/freezed_annotation.dart';
import 'enums.dart';
import 'meta.dart';
import 'progress.dart';
import 'request.dart';
import 'options.dart';

part 'task.freezed.dart';
part 'task.g.dart';

/// 下载任务
@freezed
class Task with _$Task {
  const Task._();

  const factory Task({
    required String id,
    required Meta meta,
    required Status status,
    required Progress progress,
    required String createdAt,
    required String updatedAt,
    Protocol? protocol,
    @Default(false) bool uploading,
    int? size,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  DateTime? get createdAtDateTime =>
      createdAt.isNotEmpty ? DateTime.parse(createdAt) : null;

  DateTime? get updatedAtDateTime =>
      updatedAt.isNotEmpty ? DateTime.parse(updatedAt) : null;

  /// 获取显示名称
  String get displayName {
    // 1. 优先使用用户设置的名称（如果有）
    if (meta.opts.name.isNotEmpty == true) {
      return meta.opts.name;
    }

    // 2. 对于 BT 任务，使用资源文件夹名称
    if (protocol == Protocol.bt && meta.res?.name.isNotEmpty == true) {
      return meta.res!.name;
    }

    // 3. 使用第一个文件的名称
    if (meta.res?.files.isNotEmpty == true) {
      return meta.res!.files.first.name;
    }

    // 4. 最后使用 URL 的最后一部分
    return meta.req.url.split('/').last;
  }

  /// 获取下载进度 (0-1)
  double get downloadProgress {
    // 优先使用 meta.res.size，如果没有则使用 size
    final totalSize = meta.res?.size ?? size;

    // 如果两个都拿不到，返回0
    if (totalSize == null || totalSize <= 0) return 0;

    final value = progress.downloaded / totalSize;
    return value.clamp(0.0, 1.0); // 确保值在 0-1 之间
  }
}

/// BT下载统计信息
@freezed
class TaskBtStats with _$TaskBtStats {
  const factory TaskBtStats({
    @Default(0) int downloadSpeed,
    @Default(0) int uploadSpeed,
    @Default(0) int downloaded,
    @Default(0) int uploaded,
    @Default(0) int progress,
    @Default(0) int connectedPeers,
    @Default(0) int connectedSeeds,
    @Default(0) int totalPeers,
    @Default(0) int totalSeeds,
  }) = _TaskBtStats;

  factory TaskBtStats.fromJson(Map<String, dynamic> json) =>
      _$TaskBtStatsFromJson(json);
}

/// 批量创建任务请求
@freezed
class CreateTaskBatch with _$CreateTaskBatch {
  const factory CreateTaskBatch({
    required List<Request> reqs,
    Options? opt,
  }) = _CreateTaskBatch;

  factory CreateTaskBatch.fromJson(Map<String, dynamic> json) =>
      _$CreateTaskBatchFromJson(json);
}

/// 创建任务请求
@freezed
class CreateTask with _$CreateTask {
  const factory CreateTask({
    String? rid,
    Request? req,
    Options? opt,
  }) = _CreateTask;

  factory CreateTask.fromJson(Map<String, dynamic> json) =>
      _$CreateTaskFromJson(json);
}
