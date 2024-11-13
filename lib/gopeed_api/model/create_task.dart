import 'package:freezed_annotation/freezed_annotation.dart';
import 'options.dart';
import 'request.dart';

part 'create_task.freezed.dart';
part 'create_task.g.dart';

@freezed
class CreateTask with _$CreateTask {
  const factory CreateTask({
    String? rid,
    Request? req,
    Options? opt,
  }) = _CreateTask;

  factory CreateTask.fromJson(Map<String, dynamic> json) => _$CreateTaskFromJson(json);
}
