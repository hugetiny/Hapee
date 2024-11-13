import 'package:freezed_annotation/freezed_annotation.dart';
import 'meta.dart';

part 'task.freezed.dart';
part 'task.g.dart';

enum Status { ready, running, pause, wait, error, done }

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required Meta meta,
    required Status status,
    required Progress progress,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

@freezed
class Progress with _$Progress {
  const factory Progress({
    required int used,
    required int speed,
    required int downloaded,
  }) = _Progress;

  factory Progress.fromJson(Map<String, dynamic> json) => _$ProgressFromJson(json);
}
