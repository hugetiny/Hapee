// Project imports:
import '../../../models/gopeed_models/common/models.dart';
import 'base_api.dart';

class ConfigApi extends BaseApi {
  Future<DownloaderConfig> getConfig() async {
    final response = await dio.get("/api/v1/config");
    return DownloaderConfig.fromJson(response.data['data']);
  }

  Future<void> putConfig(DownloaderConfig config) async {
    await dio.put("/api/v1/config", data: config);
  }
}
