import 'package:freezed_annotation/freezed_annotation.dart';
import 'request.dart';
import 'options.dart';
import 'resource.dart';

part 'meta.freezed.dart';
part 'meta.g.dart';

@freezed
class Meta with _$Meta {
  const factory Meta({
    required Request req,
    Resource? res,
    required Options opts,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
