import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../api/api.dart';
import '../../../../api/model/downloader_config.dart';
import '../../../../core/common/start_config.dart';
import '../../../../util/log_util.dart';
import '../../../../util/util.dart';

const _startConfigNetwork = "start.network";
const _startConfigAddress = "start.address";
const _startConfigApiToken = "start.apiToken";

const unixSocketPath = 'gopeed.sock';

const allTrackerSubscribeUrls = [
  'https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt',
  // 'https://github.com/ngosang/trackerslist/master/trackers_best.txt',
  // 'https://github.com/ngosang/trackerslist/master/trackers_all_http.txt',
  // 'https://github.com/ngosang/trackerslist/master/trackers_all_https.txt',
  // 'https://github.com/ngosang/trackerslist/master/trackers_all_udp.txt',

  'https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all_ip.txt',
  // https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_best_ip.txt

  'https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all_ws.txt',

  'https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_best_ip.txt',

  'https://raw.githubusercontent.com/XIU2/TrackersListCollection/master/all.txt',
  // 'https://github.com/XIU2/TrackersListCollection/master/best.txt',
  // 'https://github.com/XIU2/TrackersListCollection/master/http.txt',
];

const rawCdn = [
  'https://raw.githubusercontent.com',
  'https://raw.iqiq.io',
  'https://gcore.jsdelivr.net/gh',
  'https://raw.kgithub.com',
  'https://fastly.jsdelivr.net/gh',
  'https://cdn.staticaly.com/gh',
  'https://raw.fastgit.org',
  'https://ghproxy.net/https://raw.githubusercontent.com',
  'https://raw-gh.gcdn.mirr.one',
  'https://raw.githubusercontents.com',
  'https://github.moeyy.xyz/https://raw.githubusercontent.com',
  'https://ghproxy.com/https://raw.githubusercontent.com',
  'https://github.nite07.com',
  'https://raw.njuu.cf',
  'https://raw.cithub.icu',
  'https://git.yumenaka.net/https://raw.githubusercontent.com'

  //no /raw/ cdns
  // ngosang/trackerslist/master/trackers_best.txt
  // 'https://hub.nuaa.cf'
];
// https://github.com/ngosang/trackerslist/raw/master/trackers_all.txt
// const allTrackerCdns = [
//   // jsdelivr: https://cdn.jsdelivr.net/gh/ngosang/trackerslist/trackers_all.txt
//   ["https://cdn.jsdelivr.net/gh", r".*github.com(/.*)/raw/master(/.*)"],
//   // nuaa: https://hub.nuaa.cf/ngosang/trackerslist/raw/master/trackers_all.txt
//   ["https://hub.nuaa.cf", r".*github.com(/.*)"]
// ];
// final allTrackerSubscribeUrlCdns = Map.fromIterable(allTrackerSubscribeUrls,
//     key: (v) => v as String,
//     value: (v) {
//       final ret = [v as String];
//       for (final cdn in allTrackerCdns) {
//         final reg = RegExp(cdn[1]);
//         final match = reg.firstMatch(v.toString());
//         var matchStr = "";
//         for (var i = 1; i <= match!.groupCount; i++) {
//           matchStr += match.group(i)!;
//         }
//         ret.add("${cdn[0]}$matchStr");
//       }
//       return ret;
//     });

class AppController extends GetxController {
  static StartConfig? _defaultStartConfig;

  final startConfig = StartConfig().obs;
  final runningPort = 0.obs;
  final downloaderConfig = DownloaderConfig().obs;

  String runningAddress() {
    if (startConfig.value.network == 'unix') {
      return startConfig.value.address;
    }
    return '${startConfig.value.address.split(':').first}:$runningPort';
  }

  Future<StartConfig> _initDefaultStartConfig() async {
    if (_defaultStartConfig != null) {
      return _defaultStartConfig!;
    }
    _defaultStartConfig = StartConfig();
    if (!Util.isUnix()) {
      // not support unix socket, use tcp
      _defaultStartConfig!.network = "tcp";
      _defaultStartConfig!.address = "127.0.0.1:0";
    } else {
      _defaultStartConfig!.network = "unix";
      if (Util.isDesktop()) {
        _defaultStartConfig!.address = unixSocketPath;
      }
      if (Util.isMobile()) {
        _defaultStartConfig!.address =
            "${(await getTemporaryDirectory()).path}/$unixSocketPath";
      }
    }
    _defaultStartConfig!.apiToken = '';
    return _defaultStartConfig!;
  }

  Future<void> loadStartConfig() async {
    final defaultCfg = await _initDefaultStartConfig();
    final prefs = await SharedPreferences.getInstance();
    startConfig.value.network =
        prefs.getString(_startConfigNetwork) ?? defaultCfg.network;
    startConfig.value.address =
        prefs.getString(_startConfigAddress) ?? defaultCfg.address;
    startConfig.value.apiToken =
        prefs.getString(_startConfigApiToken) ?? defaultCfg.apiToken;
  }

  Future<void> loadDownloaderConfig() async {
    try {
      downloaderConfig.value = await getConfig();
    } catch (e) {
      logger.w("load downloader config fail", e);
      downloaderConfig.value = DownloaderConfig();
    }
    await _initDownloaderConfig();
  }

  Future<void> trackerUpdate() async {
    final btExtConfig = downloaderConfig.value.extra.bt;
    final result = <String>[];
    for (var url in btExtConfig.trackerSubscribeUrls) {
      var allFail = true;
      for (var cdn in rawCdn) {
        // handle github cdn
        if (url.startsWith(RegExp(r'https?://raw\.githubusercontent\.com'))) {
          cdn = cdn +
              url.replaceFirst(
                  RegExp(r'https?://raw\.githubusercontent\.com'), cdn);
        } else if (url
            .startsWith(RegExp(r'https?://github\.com(.+)/raw/(.+)'))) {
          cdn = url
              .replaceFirst(RegExp(r'https?://github\.com'), cdn)
              .replaceFirst('/raw/', '/');

          // https://github.com/ngosang/trackerslist/raw/master/trackers_all.txt
        }
        try {
          result.addAll(await _fetchTrackers(cdn));
          allFail = false;
          break;
        } catch (e) {
          logger.w("subscribe trackers fail, url: ${cdn + url}", e);
        }
      }
      if (allFail) {
        throw Exception('subscribe trackers fail, network error');
      }
    }
    btExtConfig.subscribeTrackers.clear();
    btExtConfig.subscribeTrackers.addAll(result);
    downloaderConfig.update((val) {
      val!.extra.bt.lastTrackerUpdateTime = DateTime.now();
    });
    refreshTrackers();

    await saveConfig();
  }

  refreshTrackers() {
    final btConfig = downloaderConfig.value.protocolConfig.bt;
    final btExtConfig = downloaderConfig.value.extra.bt;
    btConfig.trackers.clear();
    btConfig.trackers.addAll(btExtConfig.subscribeTrackers);
    btConfig.trackers.addAll(btExtConfig.customTrackers);
    // remove duplicate
    btConfig.trackers.toSet().toList();
  }

  Future<void> trackerUpdateOnStart() async {
    final btExtConfig = downloaderConfig.value.extra.bt;
    final lastUpdateTime = btExtConfig.lastTrackerUpdateTime;
    // if last update time is null or more than 1 day, update trackers
    if (lastUpdateTime == null ||
        lastUpdateTime.difference(DateTime.now()).inDays < 0) {
      try {
        await trackerUpdate();
      } catch (e) {
        logger.w("tracker update fail", e);
      }
    }
  }

  Future<List<String>> _fetchTrackers(String subscribeUrl) async {
    final resp = await proxyRequest(subscribeUrl);
    if (resp.statusCode != 200) {
      throw Exception('Failed to get trackers');
    }
    const ls = LineSplitter();
    return ls.convert(resp.data).where((e) => e.isNotEmpty).toList();
  }

  _initDownloaderConfig() async {
    final config = downloaderConfig.value;
    if (config.protocolConfig.http.connections == 0) {
      config.protocolConfig.http.connections = 16;
    }
    final extra = config.extra;
    if (extra.themeMode.isEmpty) {
      extra.themeMode = ThemeMode.system.name;
    }
    if (extra.locale.isEmpty) {
      // final systemLocale = getLocaleKey(ui.window.locale);

      // extra.locale = AppLocalizations.delegate.isSupported(Locale(systemLocale))
      //     ? systemLocale
      //     : 'en';
      extra.locale = Localizations.localeOf(Get.context!).languageCode;
    }
    if (extra.bt.trackerSubscribeUrls.isEmpty) {
      // default select all tracker subscribe urls
      extra.bt.trackerSubscribeUrls.addAll(allTrackerSubscribeUrls);
    }

    if (config.downloadDir.isEmpty) {
      if (Util.isDesktop()) {
        config.downloadDir = (await getDownloadsDirectory())?.path ?? "./";
      } else if (Util.isAndroid()) {
        config.downloadDir = (await getExternalStorageDirectory())?.path ??
            (await getApplicationDocumentsDirectory()).path;
        return;
      } else if (Util.isIOS()) {
        config.downloadDir = (await getApplicationDocumentsDirectory()).path;
      } else {
        config.downloadDir = './';
      }
    }
  }

  Future<void> saveConfig() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_startConfigNetwork, startConfig.value.network);
    await prefs.setString(_startConfigAddress, startConfig.value.address);
    await putConfig(downloaderConfig.value);
  }
}
