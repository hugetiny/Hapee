// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'resource.dart';

part 'resolve_result.freezed.dart';
part 'resolve_result.g.dart';

@freezed
class ResolveResult with _$ResolveResult {
  const factory ResolveResult({
    @Default("") String id,
    required Resource res,
  }) = _ResolveResult;

  factory ResolveResult.fromJson(Map<String, dynamic> json) =>
      _$ResolveResultFromJson(json);
}
