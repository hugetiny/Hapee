// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartConfigEntity _$StartConfigEntityFromJson(Map json) => StartConfigEntity(
      network: json['network'] as String,
      address: json['address'] as String,
      apiToken: json['apiToken'] as String,
    );

Map<String, dynamic> _$StartConfigEntityToJson(StartConfigEntity instance) =>
    <String, dynamic>{
      'network': instance.network,
      'address': instance.address,
      'apiToken': instance.apiToken,
    };

WindowStateEntity _$WindowStateEntityFromJson(Map json) => WindowStateEntity(
      isMaximized: json['isMaximized'] as bool?,
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WindowStateEntityToJson(WindowStateEntity instance) =>
    <String, dynamic>{
      'isMaximized': instance.isMaximized,
      'width': instance.width,
      'height': instance.height,
    };
