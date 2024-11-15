// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'request.dart';

part 'resource.freezed.dart';
part 'resource.g.dart';

@freezed
class Resource with _$Resource {
  const factory Resource({
    @Default("") String name,
    @Default(0) int size,
    @Default(false) bool range,
    required List<FileInfo> files,
    @Default("") String hash,
  }) = _Resource;

  factory Resource.fromJson(Map<String, dynamic> json) => _$ResourceFromJson(json);
}

@freezed
class FileInfo with _$FileInfo {
  const factory FileInfo({
    @Default("") String path,
    required String name,
    @Default(0) int size,
    String? ctime,
    Request? req,
  }) = _FileInfo;

  factory FileInfo.fromJson(Map<String, dynamic> json) => _$FileInfoFromJson(json);
}
