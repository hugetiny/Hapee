import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
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

  /// 获取任务总大小
  int get totalSize {
    if (size != null && size! > 0) {
      return size!;
    }
    if (meta.res != null) {
      return meta.res!.size;
    }
    return 0;
  }

  /// 获取下载速度
  int get downloadSpeed => progress.speed;

  /// 获取已下载大小
  int get downloadedSize => progress.downloaded;

  /// 获取上传速度
  int get uploadSpeed => progress.uploadSpeed;

  /// 获取已上传大小
  int get uploadedSize => progress.uploaded;

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
    if (totalSize == 0) return 0;
    final value = progress.downloaded / totalSize;
    return value.clamp(0.0, 1.0); // 确保值在 0-1 之间
  }

  /// 获取任务状态文本
  String get statusText => status.name;

  /// 获取任务协议
  String get protocolText => protocol?.name ?? 'unknown';

  /// 获取是否正在上传
  bool get isUploading => uploading;

  /// 获取是否正在下载
  bool get isDownloading => status == Status.running;

  /// 获取是否已暂停
  bool get isPaused => status == Status.pause;

  /// 获取文件夹路径
  String get dir => meta.opts.path;

  /// 获取文件完整路径
  Future<String> get filePath async {
    final downloadsDir = await getDownloadsDirectory();
    final directory = dir.isEmpty ? downloadsDir!.path : dir;

    // 对于 BT 任务，直接返回文件夹路径
    if (protocol == Protocol.bt) {
      return directory;
    }

    // 对于单文件，返回完整文件路径
    return path.join(directory, displayName);
  }

  /// 获取是否已完成
  bool get isDone => status == Status.done;

  /// 获取是否出错
  bool get isError => status == Status.error;

  /// 获取是否等待中
  bool get isWaiting => status == Status.wait;

  /// 获取是否可以暂停
  bool get canPause => status == Status.running || status == Status.wait;

  /// 获取是否可以继续
  bool get canContinue => status == Status.pause || status == Status.error;

  /// 获取是否可以删除
  bool get canDelete => true; // 所有状态都可以删除
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
//"CreateTaskBatch": {
// 	"properties": {
// 		"reqs": {
// 			"items": {
// 				"$ref": "#/components/schemas/Request"
// 			},
// 			"type": "array",
// 			"description": "Download request list"
// 		},
// 		"opt": {
// 			"$ref": "#/components/schemas/Options",
// 			"description": "Download options"
// 		}
// 	},
// 	"required": [
// 		"reqs"
// 	],
// 	"type": "object",
// 	"additionalProperties": false
// },
@freezed
class CreateTaskBatch with _$CreateTaskBatch {
  const factory CreateTaskBatch({
    required List<Request> reqs,
    Options? opt,
  }) = _CreateTaskBatch;

  factory CreateTaskBatch.fromJson(Map<String, dynamic> json) =>
      _$CreateTaskBatchFromJson(json);
}

/// 批量操作任务请求基类
@freezed
class BatchTaskOperation with _$BatchTaskOperation {
  const factory BatchTaskOperation({
    List<String>? ids,
    List<Status>? statuses,
    List<Status>? notStatuses,
  }) = _BatchTaskOperation;

  factory BatchTaskOperation.fromJson(Map<String, dynamic> json) =>
      _$BatchTaskOperationFromJson(json);
}

/// 批量删除任务请求
@freezed
class BatchDeleteTaskOperation with _$BatchDeleteTaskOperation {
  const factory BatchDeleteTaskOperation({
    List<String>? ids,
    List<Status>? statuses,
    List<Status>? notStatuses,
    @Default(false) bool force,
  }) = _BatchDeleteTaskOperation;

  factory BatchDeleteTaskOperation.fromJson(Map<String, dynamic> json) =>
      _$BatchDeleteTaskOperationFromJson(json);
}
