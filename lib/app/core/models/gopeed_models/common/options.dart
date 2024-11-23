// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'options.freezed.dart';
part 'options.g.dart';

@freezed
class Options with _$Options {
  const factory Options({
    required String name,
    required String path,
    @Default([]) List<int> selectFiles,
    Object? extra,
  }) = _Options;

  factory Options.fromJson(Map<String, dynamic> json) =>
      _$OptionsFromJson(json);
}

@freezed
class OptsExtraHttp with _$OptsExtraHttp {
  const factory OptsExtraHttp({
    @Default(0) int connections,
    @Default(false) bool autoTorrent,
  }) = _OptsExtraHttp;

  factory OptsExtraHttp.fromJson(Map<String, dynamic> json) =>
      _$OptsExtraHttpFromJson(json);
}
