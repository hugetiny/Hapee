// Project imports:
import '../../app/core/models/gopeed_models/common/models.dart';
import 'base_api.dart';

class TaskApi extends BaseApi {
  /// 获取任务列表
  Future<Result<List<dynamic>>> getTasks(List<Status> statuses) async {
    final response = await dio.get(
      "/api/v1/tasks",
      queryParameters: {
        "status": statuses.map((e) => e.name).toList(),
      },
    );
    return Result.fromJson(response.data, (json) => json as List<dynamic>);
  }

  /// 批量创建任务
  Future<Result<Map<String, dynamic>>> createTaskBatch(
      CreateTaskBatch batch) async {
    final response = await dio.post("/api/v1/tasks/batch", data: batch);
    return Result.fromJson(
        response.data, (json) => json as Map<String, dynamic>);
  }

  /// 批量任务操作基础方法
  Future<Result<Map<String, dynamic>>> _batchOperation(
    String path, {
    List<String>? ids,
    List<Status>? statuses,
    List<Status>? notStatuses,
    bool force = false,
  }) async {
    final response = await dio.put(
      path,
      queryParameters: {
        if (ids != null) "id": ids,
        if (statuses != null) "status": statuses.map((e) => e.name).toList(),
        if (notStatuses != null)
          "notStatus": notStatuses.map((e) => e.name).toList(),
        if (force) "force": force,
      },
    );
    return Result.fromJson(
        response.data, (json) => json as Map<String, dynamic>);
  }

  /// 批量暂停任务
  Future<Result<Map<String, dynamic>>> pauseTasks({
    List<String>? ids,
    List<Status>? statuses,
    List<Status>? notStatuses,
  }) async {
    return _batchOperation(
      "/api/v1/tasks/pause",
      ids: ids,
      statuses: statuses,
      notStatuses: notStatuses,
    );
  }

  /// 批量继续任务
  Future<Result<Map<String, dynamic>>> continueTasks({
    List<String>? ids,
    List<Status>? statuses,
    List<Status>? notStatuses,
  }) async {
    return _batchOperation(
      "/api/v1/tasks/continue",
      ids: ids,
      statuses: statuses,
      notStatuses: notStatuses,
    );
  }

  /// 批量删除任务
  Future<Result<Map<String, dynamic>>> deleteTasks({
    List<String>? ids,
    List<Status>? statuses,
    List<Status>? notStatuses,
    bool force = false,
  }) async {
    final response = await dio.delete(
      "/api/v1/tasks",
      queryParameters: {
        if (ids != null) "id": ids,
        if (statuses != null) "status": statuses.map((e) => e.name).toList(),
        if (notStatuses != null)
          "notStatus": notStatuses.map((e) => e.name).toList(),
        "force": force,
      },
    );
    return Result.fromJson(
        response.data, (json) => json as Map<String, dynamic>);
  }

  /// 获取任务统计信息
  Future<Result<Map<String, dynamic>>> getTaskStats(String id) async {
    final response = await dio.get("/api/v1/tasks/$id/stats");
    return Result.fromJson(
        response.data, (json) => json as Map<String, dynamic>);
  }
}
