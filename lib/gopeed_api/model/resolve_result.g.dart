// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resolve_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResolveResultImpl _$$ResolveResultImplFromJson(Map<String, dynamic> json) =>
    _$ResolveResultImpl(
      id: json['id'] as String? ?? "",
      res: Resource.fromJson(json['res'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResolveResultImplToJson(_$ResolveResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'res': instance.res,
    };
