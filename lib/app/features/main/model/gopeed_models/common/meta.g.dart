// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
      req: Request.fromJson(json['req'] as Map<String, dynamic>),
      res: json['res'] == null
          ? null
          : Resource.fromJson(json['res'] as Map<String, dynamic>),
      opts: Options.fromJson(json['opts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{
      'req': instance.req,
      'res': instance.res,
      'opts': instance.opts,
    };
