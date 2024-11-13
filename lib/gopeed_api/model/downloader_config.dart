import 'package:freezed_annotation/freezed_annotation.dart';

part 'downloader_config.freezed.dart';
part 'downloader_config.g.dart';

@freezed
class DownloaderConfig with _$DownloaderConfig {
  @Assert('maxRunning >= 0', 'maxRunning must be non-negative')
  const factory DownloaderConfig({
    @Default('') String downloadDir,
    @Default(0) int maxRunning,
    @Default(ProtocolConfig()) ProtocolConfig protocolConfig,
    @Default(ExtraConfig()) ExtraConfig extra,
    @Default(ProxyConfig()) ProxyConfig proxy,
  }) = _DownloaderConfig;

  factory DownloaderConfig.fromJson(Map<String, dynamic> json) => _$DownloaderConfigFromJson(json);
}

@freezed
class ProtocolConfig with _$ProtocolConfig {
  const factory ProtocolConfig({
    @Default(HttpConfig()) HttpConfig http,
    @Default(BtConfig()) BtConfig bt,
  }) = _ProtocolConfig;

  factory ProtocolConfig.fromJson(Map<String, dynamic> json) => _$ProtocolConfigFromJson(json);
}

@freezed
class HttpConfig with _$HttpConfig {
  const factory HttpConfig({
    @Default('Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 '
        '(KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36')
    String userAgent,
    @Default(16) int connections,
    @Default(false) bool useServerCtime,
  }) = _HttpConfig;

  factory HttpConfig.fromJson(Map<String, dynamic> json) => _$HttpConfigFromJson(json);
}

@freezed
class BtConfig with _$BtConfig {
  const factory BtConfig({
    @Default(0) int listenPort,
    @Default([]) List<String> trackers,
  }) = _BtConfig;

  factory BtConfig.fromJson(Map<String, dynamic> json) => _$BtConfigFromJson(json);
}

@freezed
class ExtraConfig with _$ExtraConfig {
  const factory ExtraConfig({
    @Default('') String themeMode,
    @Default('') String locale,
    @Default(false) bool lastDeleteTaskKeep,
    @Default(ExtraConfigBt()) ExtraConfigBt bt,
  }) = _ExtraConfig;

  factory ExtraConfig.fromJson(Map<String, dynamic> json) => _$ExtraConfigFromJson(json);
}

@freezed
class ProxyConfig with _$ProxyConfig {
  const factory ProxyConfig({
    @Default(false) bool enable,
    @Default(false) bool system,
    @Default('') String scheme,
    @Default('') String host,
    @Default('') String usr,
    @Default('') String pwd,
  }) = _ProxyConfig;

  factory ProxyConfig.fromJson(Map<String, dynamic> json) => _$ProxyConfigFromJson(json);
}

@freezed
class ExtraConfigBt with _$ExtraConfigBt {
  const factory ExtraConfigBt({
    @Default([]) List<String> trackerSubscribeUrls,
    @Default([]) List<String> subscribeTrackers,
    @Default(true) bool autoUpdateTrackers,
    DateTime? lastTrackerUpdateTime,
    @Default([]) List<String> customTrackers,
  }) = _ExtraConfigBt;

  factory ExtraConfigBt.fromJson(Map<String, dynamic> json) => _$ExtraConfigBtFromJson(json);
}
