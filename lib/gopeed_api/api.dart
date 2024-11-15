// Project imports:
import 'client/api_client.dart';
import 'endpoints/config_api.dart';
import 'endpoints/info_api.dart';
import 'endpoints/resolve_api.dart';
import 'endpoints/task_api.dart';

// 导出所有API相关类
export 'client/api_client.dart';
export 'endpoints/task_api.dart';
export 'endpoints/config_api.dart';
export 'endpoints/info_api.dart';
export 'endpoints/resolve_api.dart';

/// API 统一访问入口
class Api {
  // 私有构造函数,防止实例化
  Api._();

  // API实例
  static final TaskApi taskApi = TaskApi();
  static final ConfigApi configApi = ConfigApi();
  static final InfoApi infoApi = InfoApi();
  static final ResolveApi resolveApi = ResolveApi();

  /// 初始化API客户端
  ///
  /// [network] - 网络类型 ('unix' 或 'tcp')
  /// [address] - 服务器地址
  /// [apiToken] - API访问令牌
  static void init(String network, String address, String apiToken) {
    ApiClient.instance.initialize(
      network: network,
      address: address,
      apiToken: apiToken,
    );
  }
}
