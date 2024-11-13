import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';
part 'result.g.dart';

@Freezed(genericArgumentFactories: true)
class Result<T> with _$Result<T> {
  const factory Result({
    required int code,
    String? msg,
    T? data,
  }) = _Result<T>;

  factory Result.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$ResultFromJson(json, fromJsonT);
}
