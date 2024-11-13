import 'package:freezed_annotation/freezed_annotation.dart';

part 'request.freezed.dart';
part 'request.g.dart';

@freezed
class Request with _$Request {
  const factory Request({
    required String url,
    Object? extra,
    Map<String, String>? labels,
  }) = _Request;

  factory Request.fromJson(Map<String, dynamic> json) => _$RequestFromJson(json);
}

@freezed
class ReqExtraHttp with _$ReqExtraHttp {
  const factory ReqExtraHttp({
    @Default('GET') String method,
    @Default({}) Map<String, String> header,
    @Default('') String body,
  }) = _ReqExtraHttp;

  factory ReqExtraHttp.fromJson(Map<String, dynamic> json) => _$ReqExtraHttpFromJson(json);
}

@freezed
class ReqExtraBt with _$ReqExtraBt {
  const factory ReqExtraBt({
    @Default([]) List<String> trackers,
  }) = _ReqExtraBt;

  factory ReqExtraBt.fromJson(Map<String, dynamic> json) => _$ReqExtraBtFromJson(json);
}
