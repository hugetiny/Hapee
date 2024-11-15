
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:hapee/app/core/app_config/app_config.dart';
import 'package:hapee/app/core/database/database.dart';
import 'package:hapee/gopeed/libgopeed_boot.dart';
import 'package:hapee/gopeed_api/api.dart';
import 'app/app.dart';

// import 'package:hapee/app/baas/pocketbase.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // if (Util.isAndroid || Util.isIOS || Util.isMacOS) {
  //   await Firebase.initializeApp();
  //   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  //   // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  //   PlatformDispatcher.instance.onError = (error, stack) {
  //     FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //     return true;
  //   };
  // }
  await Database.instance.init();
  // 创建并初始化PocketBase
  // final baas = PocketBaseBaaS();
  // await baas.initialize();
  final appConfig = AppConfig();
  // 初始化libgoopeed
  try {

    await appConfig.loadStartConfig();

    appConfig.runningPort =
        await LibgopeedBoot.instance.start(appConfig.startConfig);
    Api.init(appConfig.startConfig.network, appConfig.runningAddress(),
        appConfig.startConfig.apiToken);
  } catch (e) {
    throw Exception('Failed to start LibgopeedBoot: $e');
  }

  runApp(
    ProviderScope(
      // overrides: [
      //   pocketBaseBaaSProvider.overrideWithValue(baas),
      // ],
      child: const App(),
    ),
  );
}
