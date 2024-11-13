// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResourceImpl _$$ResourceImplFromJson(Map<String, dynamic> json) =>
    _$ResourceImpl(
      name: json['name'] as String? ?? "",
      size: (json['size'] as num?)?.toInt() ?? 0,
      range: json['range'] as bool? ?? false,
      files: (json['files'] as List<dynamic>)
          .map((e) => FileInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      hash: json['hash'] as String? ?? "",
    );

Map<String, dynamic> _$$ResourceImplToJson(_$ResourceImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'size': instance.size,
      'range': instance.range,
      'files': instance.files,
      'hash': instance.hash,
    };

_$FileInfoImpl _$$FileInfoImplFromJson(Map<String, dynamic> json) =>
    _$FileInfoImpl(
      path: json['path'] as String? ?? "",
      name: json['name'] as String,
      size: (json['size'] as num?)?.toInt() ?? 0,
      req: json['req'] == null
          ? null
          : Request.fromJson(json['req'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FileInfoImplToJson(_$FileInfoImpl instance) =>
    <String, dynamic>{
      'path': instance.path,
      'name': instance.name,
      'size': instance.size,
      'req': instance.req,
    };
