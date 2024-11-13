// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateTaskImpl _$$CreateTaskImplFromJson(Map<String, dynamic> json) =>
    _$CreateTaskImpl(
      rid: json['rid'] as String?,
      req: json['req'] == null
          ? null
          : Request.fromJson(json['req'] as Map<String, dynamic>),
      opt: json['opt'] == null
          ? null
          : Options.fromJson(json['opt'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreateTaskImplToJson(_$CreateTaskImpl instance) =>
    <String, dynamic>{
      'rid': instance.rid,
      'req': instance.req,
      'opt': instance.opt,
    };
