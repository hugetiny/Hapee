// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../app/core/models/gopeed_models/common/models.dart';
import 'base_api.dart';

class ResolveApi extends BaseApi {
  Future<ResolveResult> resolve(
    Request request, {
    CancelToken? cancelToken,
  }) async {
    final response = await dio.post(
      "/api/v1/resolve",
      data: request,
      cancelToken: cancelToken,
    );
    return ResolveResult.fromJson(response.data['data']);
  }
}
