// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_config.freezed.dart';
part 'start_config.g.dart';

@freezed
class StartConfig with _$StartConfig {
  const factory StartConfig({
    @Default('') String network,
    @Default('') String address,
    @Default('bolt') String storage,
    @Default('') String storageDir,
    @Default(0) int refreshInterval,
    @Default('') String apiToken,
  }) = _StartConfig;

  factory StartConfig.fromJson(Map<String, dynamic> json) =>
      _$StartConfigFromJson(json);
}
