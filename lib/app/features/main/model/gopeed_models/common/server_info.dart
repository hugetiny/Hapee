// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_info.freezed.dart';
part 'server_info.g.dart';

@freezed
class ServerInfo with _$ServerInfo {
  const factory ServerInfo({
    required String version,
    required String os,
    required String arch,
    required String goVersion,
    required String gitHash,
    required String buildTime,
  }) = _ServerInfo;

  factory ServerInfo.fromJson(Map<String, dynamic> json) =>
      _$ServerInfoFromJson(json);
}
