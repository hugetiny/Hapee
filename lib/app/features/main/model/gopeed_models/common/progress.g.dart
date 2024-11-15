// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProgressImpl _$$ProgressImplFromJson(Map<String, dynamic> json) =>
    _$ProgressImpl(
      used: (json['used'] as num).toInt(),
      speed: (json['speed'] as num).toInt(),
      downloaded: (json['downloaded'] as num).toInt(),
      uploadSpeed: (json['uploadSpeed'] as num?)?.toInt() ?? 0,
      uploaded: (json['uploaded'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ProgressImplToJson(_$ProgressImpl instance) =>
    <String, dynamic>{
      'used': instance.used,
      'speed': instance.speed,
      'downloaded': instance.downloaded,
      'uploadSpeed': instance.uploadSpeed,
      'uploaded': instance.uploaded,
    };
