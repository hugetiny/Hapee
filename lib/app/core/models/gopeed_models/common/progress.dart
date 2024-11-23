// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress.freezed.dart';
part 'progress.g.dart';

@freezed
class Progress with _$Progress {
  const factory Progress({
    required int used,
    required int speed,
    required int downloaded,
    @Default(0) int uploadSpeed,
    @Default(0) int uploaded,
  }) = _Progress;

  factory Progress.fromJson(Map<String, dynamic> json) =>
      _$ProgressFromJson(json);
}
