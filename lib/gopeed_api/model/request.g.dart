// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestImpl _$$RequestImplFromJson(Map<String, dynamic> json) =>
    _$RequestImpl(
      url: json['url'] as String,
      extra: json['extra'],
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$$RequestImplToJson(_$RequestImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'extra': instance.extra,
      'labels': instance.labels,
    };

_$ReqExtraHttpImpl _$$ReqExtraHttpImplFromJson(Map<String, dynamic> json) =>
    _$ReqExtraHttpImpl(
      method: json['method'] as String? ?? 'GET',
      header: (json['header'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      body: json['body'] as String? ?? '',
    );

Map<String, dynamic> _$$ReqExtraHttpImplToJson(_$ReqExtraHttpImpl instance) =>
    <String, dynamic>{
      'method': instance.method,
      'header': instance.header,
      'body': instance.body,
    };

_$ReqExtraBtImpl _$$ReqExtraBtImplFromJson(Map<String, dynamic> json) =>
    _$ReqExtraBtImpl(
      trackers: (json['trackers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ReqExtraBtImplToJson(_$ReqExtraBtImpl instance) =>
    <String, dynamic>{
      'trackers': instance.trackers,
    };
