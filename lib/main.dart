import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:hapee/gopeed/common/start_config.dart';
import 'package:hapee/gopeed/libgopeed_boot.dart';
import 'package:hapee/util/util.dart';
// import 'package:hapee/app/baas/pocketbase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Util.isAndroid || Util.isIOS || Util.isMacOS) {
    await Firebase.initializeApp();
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  // 创建并初始化PocketBase
  // final baas = PocketBaseBaaS();
  // await baas.initialize();

  // 初始化libgoopeed
  try {
    // await controller.loadStartConfig();
    // final startCfg = controller.startConfig.value;
    // controller.runningPort.value = await LibgopeedBoot.instance.start(startCfg);
    // api.init(startCfg.network, controller.runningAddress(), startCfg.apiToken);
    final tempDir = await getTemporaryDirectory();
    final storageDir = await Util.storageDir;
    await LibgopeedBoot.instance.start(StartConfig(
      network: Util.supportUnixSocket ? 'unix' : 'tcp',
      address:
          Util.supportUnixSocket ? '${tempDir.path}/hapee.sock' : '127.0.0.1:0',
      apiToken: '',
      storageDir: storageDir,
    ));
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
