// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../client/api_client.dart';

/// API 基类
abstract class BaseApi {
  Dio get dio => _dio ?? ApiClient.instance.dio;
  Dio? _dio;

  /// 用于测试时注入 mock dio 客户端
  @visibleForTesting
  set dio(Dio? value) => _dio = value;
}
