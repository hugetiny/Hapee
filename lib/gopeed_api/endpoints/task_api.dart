// Project imports:
import 'package:flutter/foundation.dart';

import '../../app/features/main/model/gopeed_models/common/models.dart';
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

  /// 创建任务
  Future<Result<Map<String, dynamic>>> createTask(CreateTask task) async {
    final response = await dio.post("/api/v1/tasks", data: task);
    return Result.fromJson(response.data, (json) => json as Map<String, dynamic>);
  }

  /// 批量创建任务
  Future<Result<Map<String, dynamic>>> createTaskBatch(CreateTaskBatch batch) async {
    final response = await dio.post("/api/v1/tasks/batch", data: batch);
    return Result.fromJson(response.data, (json) => json as Map<String, dynamic>);
  }

  /// 暂停任务
  Future<Result<Map<String, dynamic>>> pauseTask(String id) async {
    final response = await dio.put("/api/v1/tasks/$id/pause");
    return Result.fromJson(response.data, (json) => json as Map<String, dynamic>);
  }

  /// 批量暂停任务
  Future<Result<Map<String, dynamic>>> pauseTasks({
    List<String>? ids,
    List<Status>? statuses,
    List<Status>? notStatuses,
  }) async {
    final response = await dio.put(
      "/api/v1/tasks/pause",
      queryParameters: {
        if (ids != null) "id": ids,
        if (statuses != null) "status": statuses.map((e) => e.name).toList(),
        if (notStatuses != null)
          "notStatus": notStatuses.map((e) => e.name).toList(),
      },
    );
    return Result.fromJson(response.data, (json) => json as Map<String, dynamic>);
  }

  /// 继续任务
  Future<Result<Map<String, dynamic>>> continueTask(String id) async {
    final response = await dio.put("/api/v1/tasks/$id/continue");
    return Result.fromJson(response.data, (json) => json as Map<String, dynamic>);
  }

  /// 批量继续任务
  Future<Result<Map<String, dynamic>>> continueTasks({
    List<String>? ids,
    List<Status>? statuses,
    List<Status>? notStatuses,
  }) async {
    final response = await dio.put(
      "/api/v1/tasks/continue",
      queryParameters: {
        if (ids != null) "id": ids,
        if (statuses != null) "status": statuses.map((e) => e.name).toList(),
        if (notStatuses != null)
          "notStatus": notStatuses.map((e) => e.name).toList(),
      },
    );
    return Result.fromJson(response.data, (json) => json as Map<String, dynamic>);
  }

  /// 删除任务
  Future<Result<Map<String, dynamic>>> deleteTask(String id, bool force) async {
    final response = await dio.delete(
      "/api/v1/tasks/$id",
      queryParameters: {"force": force},
    );
    return Result.fromJson(response.data, (json) => json as Map<String, dynamic>);
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
    return Result.fromJson(response.data, (json) => json as Map<String, dynamic>);
  }

  /// 获取任务统计信息
  Future<Result<Map<String, dynamic>>> getTaskStats(String id) async {
    final response = await dio.get("/api/v1/tasks/$id/stats");
    return Result.fromJson(response.data, (json) => json as Map<String, dynamic>);
  }
}
