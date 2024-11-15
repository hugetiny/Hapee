// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as String,
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      status: $enumDecode(_$StatusEnumMap, json['status']),
      progress: Progress.fromJson(json['progress'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      protocol: $enumDecodeNullable(_$ProtocolEnumMap, json['protocol']),
      uploading: json['uploading'] as bool? ?? false,
      size: (json['size'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'status': _$StatusEnumMap[instance.status]!,
      'progress': instance.progress,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'protocol': _$ProtocolEnumMap[instance.protocol],
      'uploading': instance.uploading,
      'size': instance.size,
    };

const _$StatusEnumMap = {
  Status.ready: 'ready',
  Status.running: 'running',
  Status.pause: 'pause',
  Status.wait: 'wait',
  Status.error: 'error',
  Status.done: 'done',
};

const _$ProtocolEnumMap = {
  Protocol.none: '',
  Protocol.http: 'http',
  Protocol.bt: 'bt',
};

_$TaskBtStatsImpl _$$TaskBtStatsImplFromJson(Map<String, dynamic> json) =>
    _$TaskBtStatsImpl(
      downloadSpeed: (json['downloadSpeed'] as num?)?.toInt() ?? 0,
      uploadSpeed: (json['uploadSpeed'] as num?)?.toInt() ?? 0,
      downloaded: (json['downloaded'] as num?)?.toInt() ?? 0,
      uploaded: (json['uploaded'] as num?)?.toInt() ?? 0,
      progress: (json['progress'] as num?)?.toInt() ?? 0,
      connectedPeers: (json['connectedPeers'] as num?)?.toInt() ?? 0,
      connectedSeeds: (json['connectedSeeds'] as num?)?.toInt() ?? 0,
      totalPeers: (json['totalPeers'] as num?)?.toInt() ?? 0,
      totalSeeds: (json['totalSeeds'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$TaskBtStatsImplToJson(_$TaskBtStatsImpl instance) =>
    <String, dynamic>{
      'downloadSpeed': instance.downloadSpeed,
      'uploadSpeed': instance.uploadSpeed,
      'downloaded': instance.downloaded,
      'uploaded': instance.uploaded,
      'progress': instance.progress,
      'connectedPeers': instance.connectedPeers,
      'connectedSeeds': instance.connectedSeeds,
      'totalPeers': instance.totalPeers,
      'totalSeeds': instance.totalSeeds,
    };

_$CreateTaskBatchImpl _$$CreateTaskBatchImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateTaskBatchImpl(
      reqs: (json['reqs'] as List<dynamic>)
          .map((e) => Request.fromJson(e as Map<String, dynamic>))
          .toList(),
      opt: json['opt'] == null
          ? null
          : Options.fromJson(json['opt'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreateTaskBatchImplToJson(
        _$CreateTaskBatchImpl instance) =>
    <String, dynamic>{
      'reqs': instance.reqs,
      'opt': instance.opt,
    };

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
