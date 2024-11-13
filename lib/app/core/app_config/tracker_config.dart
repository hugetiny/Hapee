// const trackerSubscribeUrls = [
//   'https://github.com/ngosang/trackerslist/raw/master/trackers_all.txt',
//   'https://github.com/XIU2/TrackersListCollection/raw/master/all.txt',
// ];

// const trackerCdns = [
//   ["https://fastly.jsdelivr.net/gh", r".*github.com(/.*)/raw/master(/.*)"],
//   [
//     "https://ghproxy.com/https://raw.githubusercontent.com",
//     r".*github.com(/.*)/raw(/.*)"
//   ],
//   [
//     "https://mirror.ghproxy.com/https://raw.githubusercontent.com",
//     r".*github.com(/.*)/raw(/.*)"
//   ],
// ];

// final trackerSubscribeUrlCdns =
//     trackerSubscribeUrls.asMap().map((_, url) => MapEntry(
//           url,
//           [
//             url,
//             ...trackerCdns.map((cdn) =>
//                 "${cdn[0]}${RegExp(cdn[1]).firstMatch(url)!.group(1)!}")
//           ],
//         ));
// refreshTrackers() {
//   final btConfig = downloaderConfig.value.protocolConfig.bt;
//   final btExtConfig = downloaderConfig.value.extra.bt;
//   btConfig.trackers.clear();
//   btConfig.trackers.addAll(btExtConfig.subscribeTrackers);
//   btConfig.trackers.addAll(btExtConfig.customTrackers);
//   // remove duplicate
//   btConfig.trackers.toSet().toList();
// }

// Future<void> _initTrackerUpdate() async {
//   final btExtConfig = downloaderConfig.value.extra.bt;
//   final lastUpdateTime = btExtConfig.lastTrackerUpdateTime;
//   // if last update time is null or more than 1 day, update trackers
//   if (btExtConfig.autoUpdateTrackers &&
//       (lastUpdateTime == null ||
//           lastUpdateTime.difference(DateTime.now()).inDays < 0)) {
//     try {
//       await trackerUpdate();
//     } catch (e) {
//       logger.w("tracker update fail", error: e);
//     }
//   }
// }

//   Future<void> trackerUpdate() async {
//     final btExtConfig = downloaderConfig.value.extra.bt;
//     final result = <String>[];
//     for (var u in btExtConfig.trackerSubscribeUrls) {
//       final cdns = trackerSubscribeUrlCdns[u];
//       if (cdns == null) {
//         continue;
//       }
//       try {
//         final trackers =
//             await Util.anyOk(cdns.map((cdn) => _fetchTrackers(cdn)));
//         result.addAll(trackers);
//       } catch (e) {
//         logger.w("subscribe trackers fail, url: $u", error: e);
//         return;
//       }
//     }
//     btExtConfig.subscribeTrackers.clear();
//     btExtConfig.subscribeTrackers.addAll(result);
//     downloaderConfig.update((val) {
//       val!.extra.bt.lastTrackerUpdateTime = DateTime.now();
//     });
//     refreshTrackers();

//     await saveConfig();
//   }



//   Future<List<String>> _fetchTrackers(String subscribeUrl) async {
//     final resp = await proxyRequest(subscribeUrl);
//     if (resp.statusCode != 200) {
//       throw Exception(
//           'Failed to get trackers, status code: ${resp.statusCode}');
//     }
//     if (resp.data == null || resp.data!.isEmpty) {
//       throw Exception('Failed to get trackers, data is null');
//     }
//     const ls = LineSplitter();
//     return ls.convert(resp.data!).where((e) => e.isNotEmpty).toList();
//   }

//   _initTrackerUpdate().onError((error, stackTrace) => logger
//         .w("initTrackerUpdate error", error: error, stackTrace: stackTrace));
