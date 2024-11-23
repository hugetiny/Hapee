// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hapee/app/core/models/gopeed_models/common/task.dart';

part 'result.freezed.dart';
part 'result.g.dart';

/// API 响应结果
@Freezed(genericArgumentFactories: true)
class Result<T> with _$Result<T> {
  const factory Result({
    required int code, // 响应码,0表示成功,其他值表示错误
    @Default('') String msg, // 错误消息,当code!=0时有值
    T? data, // 成功数据,当code==0时有值
  }) = _Result<T>;

  factory Result.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$ResultFromJson(json, fromJsonT);
}

/// 扩展方法
extension ResultExtension<T> on Result<T> {
  /// 是否成功
  bool get isSuccess => code == 0;

  /// 处理结果
  T when<T>({
    required T Function(dynamic data) onData,
    required T Function(String message, StackTrace stackTrace) onError,
  }) {
    if (isSuccess && data != null) {
      return onData(data);
    }
    return onError(msg, StackTrace.current);
  }

  /// 获取任务列表数据
  List<Task> getTaskList() {
    if (data == null) return [];
    final list = data as List<dynamic>;
    return list.map((e) {
      // print('Task JSON: $e'); // 打印每个任务的原始数据
      try {
        return Task.fromJson(e as Map<String, dynamic>);
      } catch (error, stack) {
        print('Error parsing task: $error');
        print('Stack: $stack');
        print('Problematic JSON: $e');
        rethrow;
      }
    }).toList();
  }

  /// 获取字符串数据
  String getString() {
    if (!isSuccess) throw Exception(msg);
    if (data == null) throw Exception('Data is null');
    return data as String;
  }

  /// 获取字符串列表数据
  List<String> getStringList() {
    if (!isSuccess) throw Exception(msg);
    if (data == null) throw Exception('Data is null');
    return (data as List).cast<String>();
  }

  /// 获取任务统计数据
  TaskBtStats getTaskStats() {
    if (!isSuccess) throw Exception(msg);
    if (data == null) throw Exception('Data is null');
    return TaskBtStats.fromJson(data as Map<String, dynamic>);
  }
}
