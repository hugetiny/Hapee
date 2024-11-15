// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DownloaderConfigImpl _$$DownloaderConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$DownloaderConfigImpl(
      downloadDir: json['downloadDir'] as String? ?? '',
      maxRunning: (json['maxRunning'] as num?)?.toInt() ?? 0,
      protocolConfig: json['protocolConfig'] == null
          ? const ProtocolConfig()
          : ProtocolConfig.fromJson(
              json['protocolConfig'] as Map<String, dynamic>),
      extra: json['extra'] == null
          ? const ExtraConfig()
          : ExtraConfig.fromJson(json['extra'] as Map<String, dynamic>),
      proxy: json['proxy'] == null
          ? const ProxyConfig()
          : ProxyConfig.fromJson(json['proxy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DownloaderConfigImplToJson(
        _$DownloaderConfigImpl instance) =>
    <String, dynamic>{
      'downloadDir': instance.downloadDir,
      'maxRunning': instance.maxRunning,
      'protocolConfig': instance.protocolConfig,
      'extra': instance.extra,
      'proxy': instance.proxy,
    };

_$ProtocolConfigImpl _$$ProtocolConfigImplFromJson(Map<String, dynamic> json) =>
    _$ProtocolConfigImpl(
      http: json['http'] == null
          ? const HttpConfig()
          : HttpConfig.fromJson(json['http'] as Map<String, dynamic>),
      bt: json['bt'] == null
          ? const BtConfig()
          : BtConfig.fromJson(json['bt'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProtocolConfigImplToJson(
        _$ProtocolConfigImpl instance) =>
    <String, dynamic>{
      'http': instance.http,
      'bt': instance.bt,
    };

_$HttpConfigImpl _$$HttpConfigImplFromJson(Map<String, dynamic> json) =>
    _$HttpConfigImpl(
      userAgent: json['userAgent'] as String? ??
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 '
              '(KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36',
      connections: (json['connections'] as num?)?.toInt() ?? 16,
      useServerCtime: json['useServerCtime'] as bool? ?? false,
    );

Map<String, dynamic> _$$HttpConfigImplToJson(_$HttpConfigImpl instance) =>
    <String, dynamic>{
      'userAgent': instance.userAgent,
      'connections': instance.connections,
      'useServerCtime': instance.useServerCtime,
    };

_$BtConfigImpl _$$BtConfigImplFromJson(Map<String, dynamic> json) =>
    _$BtConfigImpl(
      listenPort: (json['listenPort'] as num?)?.toInt() ?? 0,
      trackers: (json['trackers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$BtConfigImplToJson(_$BtConfigImpl instance) =>
    <String, dynamic>{
      'listenPort': instance.listenPort,
      'trackers': instance.trackers,
    };

_$ExtraConfigImpl _$$ExtraConfigImplFromJson(Map<String, dynamic> json) =>
    _$ExtraConfigImpl(
      themeMode: json['themeMode'] as String? ?? '',
      locale: json['locale'] as String? ?? '',
      lastDeleteTaskKeep: json['lastDeleteTaskKeep'] as bool? ?? false,
      bt: json['bt'] == null
          ? const ExtraConfigBt()
          : ExtraConfigBt.fromJson(json['bt'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ExtraConfigImplToJson(_$ExtraConfigImpl instance) =>
    <String, dynamic>{
      'themeMode': instance.themeMode,
      'locale': instance.locale,
      'lastDeleteTaskKeep': instance.lastDeleteTaskKeep,
      'bt': instance.bt,
    };

_$ProxyConfigImpl _$$ProxyConfigImplFromJson(Map<String, dynamic> json) =>
    _$ProxyConfigImpl(
      enable: json['enable'] as bool? ?? false,
      system: json['system'] as bool? ?? false,
      scheme: json['scheme'] as String? ?? '',
      host: json['host'] as String? ?? '',
      usr: json['usr'] as String? ?? '',
      pwd: json['pwd'] as String? ?? '',
    );

Map<String, dynamic> _$$ProxyConfigImplToJson(_$ProxyConfigImpl instance) =>
    <String, dynamic>{
      'enable': instance.enable,
      'system': instance.system,
      'scheme': instance.scheme,
      'host': instance.host,
      'usr': instance.usr,
      'pwd': instance.pwd,
    };

_$ExtraConfigBtImpl _$$ExtraConfigBtImplFromJson(Map<String, dynamic> json) =>
    _$ExtraConfigBtImpl(
      trackerSubscribeUrls: (json['trackerSubscribeUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      subscribeTrackers: (json['subscribeTrackers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      autoUpdateTrackers: json['autoUpdateTrackers'] as bool? ?? true,
      lastTrackerUpdateTime: json['last_tracker_update_time'] as String?,
      customTrackers: (json['customTrackers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ExtraConfigBtImplToJson(_$ExtraConfigBtImpl instance) =>
    <String, dynamic>{
      'trackerSubscribeUrls': instance.trackerSubscribeUrls,
      'subscribeTrackers': instance.subscribeTrackers,
      'autoUpdateTrackers': instance.autoUpdateTrackers,
      'last_tracker_update_time': instance.lastTrackerUpdateTime,
      'customTrackers': instance.customTrackers,
    };
