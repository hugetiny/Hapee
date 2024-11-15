// Project imports:
import '../../app/features/main/model/gopeed_models/common/models.dart';
import 'base_api.dart';

class InfoApi extends BaseApi {
  Future<ServerInfo> getInfo() async {
    final response = await dio.get("/api/v1/info");
    return ServerInfo.fromJson(response.data['data']);
  }
}
