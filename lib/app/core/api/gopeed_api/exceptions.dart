/// API 异常基类
abstract class ApiException implements Exception {
  final String message;
  final dynamic error;
  final StackTrace? stackTrace;

  const ApiException(this.message, [this.error, this.stackTrace]);

  @override
  String toString() => 'ApiException: $message${error != null ? ' ($error)' : ''}';
}

/// 连接超时异常
class TimeoutException extends ApiException {
  const TimeoutException([super.message = 'Request timed out']);
}

/// API 响应错误
class ApiResponseException extends ApiException {
  final int code;

  const ApiResponseException(this.code, String message) : super(message);

  @override
  String toString() => 'ApiResponseException: [$code] $message';
}

/// 网络错误
class NetworkException extends ApiException {
  const NetworkException(super.message, [super.error, super.stackTrace]);
}
