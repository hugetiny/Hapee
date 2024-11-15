// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';

// Project imports:
import 'package:hapee/app/core/database/database.dart';
import 'package:hapee/app/core/database/entity.dart';
import 'package:hapee/gopeed/common/start_config.dart';
import 'package:hapee/gopeed_api/api.dart';
import 'package:hapee/shared/util.dart';
import '../../features/main/model/gopeed_models/common/config.dart';
import 'mobile_config.dart';

// import 'package:app_links/app_links.dart';


// import 'package:uri_to_file/uri_to_file.dart';
// import 'package:url_launcher/url_launcher.dart';



// import '../../../../database/database.dart';
// import '../../../../database/entity.dart';
// import '../../../../main.dart';
// import '../../../../util/log_util.dart';
// import '../../../../util/package_info.dart';
// import '../../../../util/util.dart';
// import '../../../platform/mobile/controller/mobile_controller.dart';
// import '../../../platform/desktop/controller/window_manager.dart';

final logger = Logger();

class AppConfig {
  static StartConfig? _defaultStartConfig;

  var autoStartup = false;
  var startConfig = StartConfig();
  var runningPort = 0;
  var downloaderConfig = DownloaderConfig();

  Future<void> init() async {
    if (Util.isMobile) {
      await BackgroundServiceHelper.initializeService().onError(
          (error, stackTrace) => logger.w("initForegroundTask error",
              error: error, stackTrace: stackTrace));
    }

    if (Util.isDesktop) {
      _initLaunchAtStartup().onError((error, stackTrace) => logger.w(
          "initLaunchAtStartup error",
          error: error,
          stackTrace: stackTrace));
    }
  }

  Future<StartConfig> _initDefaultStartConfig() async {
    if (_defaultStartConfig != null) return _defaultStartConfig!;

    final tempDir = await getTemporaryDirectory();
    _defaultStartConfig = StartConfig(
      network: Util.supportUnixSocket ? 'unix' : 'tcp',
      address:
          Util.supportUnixSocket ? '${tempDir.path}/hapee.sock' : '127.0.0.1:0',
      apiToken: '',
      storage: 'bolt',
      storageDir: await Util.storageDir,
      refreshInterval: 0,
    );

    return _defaultStartConfig!;
  }

  String runningAddress() {
    if (startConfig.network == 'unix') {
      return startConfig.address;
    }
    return '${startConfig.address.split(':').first}:$runningPort';
  }

  Future<StartConfig> loadStartConfig() async {
    final defaultCfg = await _initDefaultStartConfig();
    final saveCfg = Database.instance.getStartConfig();

    startConfig = StartConfig(
      network: saveCfg?.network ?? defaultCfg.network,
      address: saveCfg?.address ?? defaultCfg.address,
      apiToken: saveCfg?.apiToken ?? defaultCfg.apiToken,
    );

    return startConfig;
  }

  Future<DownloaderConfig> loadDownloaderConfig() async {
    try {
      downloaderConfig = await Api.configApi.getConfig();
      logger.i(downloaderConfig);
    } catch (e) {
      logger.w("load downloader config fail",
          error: e, stackTrace: StackTrace.current);
      downloaderConfig = DownloaderConfig();
    }
    await _initDownloaderConfig();
    return downloaderConfig;
  }

  _initDownloaderConfig() async {
    var config = downloaderConfig;
    final extra = config.extra;

    if (extra.themeMode.isEmpty) {
      downloaderConfig = downloaderConfig.copyWith(
        extra: extra.copyWith(
          themeMode: ThemeMode.dark.name,
        ),
      );
    }
    // if (extra.locale.isEmpty) {
    //   final systemLocale = getLocaleKey(PlatformDispatcher.instance.locale);
    //   extra.locale = messages.keys.containsKey(systemLocale)
    //       ? systemLocale
    //       : getLocaleKey(fallbackLocale);
    // }
    // if (extra.bt.trackerSubscribeUrls.isEmpty) {
    //   // default select all tracker subscribe urls
    //   extra.bt.trackerSubscribeUrls.addAll(trackerSubscribeUrls);
    // }

    final proxy = config.proxy;
    if (proxy.scheme.isEmpty) {
      downloaderConfig = downloaderConfig.copyWith(
        proxy: proxy.copyWith(scheme: 'http'),
      );
    }

    if (config.downloadDir.isEmpty) {
      String newDownloadDir;

      try {
        if (Util.isDesktop) {
          // 桌面端优先使用系统下载目录
          newDownloadDir = (await getDownloadsDirectory())?.path ?? './';
        } else if (Util.isAndroid) {
          // Android 优先使用外部存储，失败则使用应用文档目录
          newDownloadDir = (await getExternalStorageDirectory())?.path ??
              (await getApplicationDocumentsDirectory()).path;

          // 创建 Download 子目录
          final downloadDir = Directory('$newDownloadDir/Hapee');
          await downloadDir.create(recursive: true);
          newDownloadDir = downloadDir.path;
        } else if (Util.isIOS) {
          // iOS 使用应用文档目录
          final docDir = await getApplicationDocumentsDirectory();
          final downloadDir = Directory('${docDir.path}/Hapee');
          await downloadDir.create(recursive: true);
          newDownloadDir = downloadDir.path;
        } else {
          newDownloadDir = './';
        }

        downloaderConfig =
            downloaderConfig.copyWith(downloadDir: newDownloadDir);
      } catch (e) {
        logger.w("设置下载目录失败", error: e, stackTrace: StackTrace.current);
        downloaderConfig = downloaderConfig.copyWith(downloadDir: './');
      }
    }
  }

  Future<void> _initLaunchAtStartup() async {
    final args = <String>[];
    final packageInfo = await PackageInfo.fromPlatform();
    if (Util.isWindows) {
      args.add('--hidden-window');
    } else {
      args.add('--hidden');
    }
    launchAtStartup.setup(
        appName: packageInfo.appName,
        appPath: Platform.resolvedExecutable,
        // Set packageName parameter to support MSIX.
        packageName: 'com.hapee.app',
        args: args);
    autoStartup = await launchAtStartup.isEnabled();
  }

  Future<void> saveConfig() async {
    Database.instance.saveStartConfig(StartConfigEntity(
        network: startConfig.network,
        address: startConfig.address,
        apiToken: startConfig.apiToken));
    await Api.configApi.putConfig(downloaderConfig);
  }
}
