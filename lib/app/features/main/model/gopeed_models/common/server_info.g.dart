// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServerInfoImpl _$$ServerInfoImplFromJson(Map<String, dynamic> json) =>
    _$ServerInfoImpl(
      version: json['version'] as String,
      os: json['os'] as String,
      arch: json['arch'] as String,
      goVersion: json['goVersion'] as String,
      gitHash: json['gitHash'] as String,
      buildTime: json['buildTime'] as String,
    );

Map<String, dynamic> _$$ServerInfoImplToJson(_$ServerInfoImpl instance) =>
    <String, dynamic>{
      'version': instance.version,
      'os': instance.os,
      'arch': instance.arch,
      'goVersion': instance.goVersion,
      'gitHash': instance.gitHash,
      'buildTime': instance.buildTime,
    };
