// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

// Project imports:
import '../exceptions.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._();
  late final Dio dio;

  ApiClient._();

  static ApiClient get instance => _instance;

  void initialize({
    required String network,
    required String address,
    required String apiToken,
  }) {
    final isUnixSocket = network == 'unix';
    final baseUrl = _getBaseUrl(isUnixSocket, address);

    dio = Dio()
      ..options = BaseOptions(
        baseUrl: baseUrl,
        contentType: Headers.jsonContentType,
        sendTimeout: const Duration(seconds: 5),
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 60),
      )
      ..interceptors.addAll([
        _createAuthInterceptor(apiToken),
        _createErrorInterceptor(),
      ]);

    if (isUnixSocket) {
      _configureUnixSocket(address);
    }
  }

  String _getBaseUrl(bool isUnixSocket, String address) {
    if (isUnixSocket) return 'http://127.0.0.1';
    return 'http://$address';
  }

  InterceptorsWrapper _createAuthInterceptor(String apiToken) {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        if (apiToken.isNotEmpty) {
          options.headers['X-Api-Token'] = apiToken;
        }
        handler.next(options);
      },
    );
  }

  InterceptorsWrapper _createErrorInterceptor() {
    return InterceptorsWrapper(
      onError: (error, handler) {
        if (error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.sendTimeout ||
            error.type == DioExceptionType.receiveTimeout) {
          handler.reject(
            DioException(
              requestOptions: error.requestOptions,
              error: TimeoutException(),
            ),
          );
          return;
        }

        if (error.response != null) {
          final response = error.response!;
          if (response.data != null && response.data['code'] != 0) {
            handler.reject(
              DioException(
                requestOptions: error.requestOptions,
                error: ApiResponseException(
                  response.data['code'],
                  response.data['msg'] ?? 'Unknown error',
                ),
              ),
            );
            return;
          }
        }

        handler.reject(
          DioException(
            requestOptions: error.requestOptions,
            error: NetworkException(
              error.message ?? 'Network error',
              error.error,
              error.stackTrace,
            ),
          ),
        );
      },
    );
  }

  void _configureUnixSocket(String address) {
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.connectionFactory = (_, __, ___) {
        return Socket.startConnect(
          InternetAddress(address, type: InternetAddressType.unix),
          0,
        );
      };
      return client;
    };
  }
}
