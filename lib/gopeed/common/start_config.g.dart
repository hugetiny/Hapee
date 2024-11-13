// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StartConfigImpl _$$StartConfigImplFromJson(Map<String, dynamic> json) =>
    _$StartConfigImpl(
      network: json['network'] as String? ?? '',
      address: json['address'] as String? ?? '',
      storage: json['storage'] as String? ?? 'bolt',
      storageDir: json['storageDir'] as String? ?? '',
      refreshInterval: (json['refreshInterval'] as num?)?.toInt() ?? 0,
      apiToken: json['apiToken'] as String? ?? '',
    );

Map<String, dynamic> _$$StartConfigImplToJson(_$StartConfigImpl instance) =>
    <String, dynamic>{
      'network': instance.network,
      'address': instance.address,
      'storage': instance.storage,
      'storageDir': instance.storageDir,
      'refreshInterval': instance.refreshInterval,
      'apiToken': instance.apiToken,
    };
