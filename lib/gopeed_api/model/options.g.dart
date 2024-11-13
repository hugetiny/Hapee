// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OptionsImpl _$$OptionsImplFromJson(Map<String, dynamic> json) =>
    _$OptionsImpl(
      name: json['name'] as String,
      path: json['path'] as String,
      selectFiles: (json['selectFiles'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      extra: json['extra'],
    );

Map<String, dynamic> _$$OptionsImplToJson(_$OptionsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'path': instance.path,
      'selectFiles': instance.selectFiles,
      'extra': instance.extra,
    };

_$OptsExtraHttpImpl _$$OptsExtraHttpImplFromJson(Map<String, dynamic> json) =>
    _$OptsExtraHttpImpl(
      connections: (json['connections'] as num?)?.toInt() ?? 0,
      autoTorrent: json['autoTorrent'] as bool? ?? false,
    );

Map<String, dynamic> _$$OptsExtraHttpImplToJson(_$OptsExtraHttpImpl instance) =>
    <String, dynamic>{
      'connections': instance.connections,
      'autoTorrent': instance.autoTorrent,
    };
