// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

// Project imports:
import 'package:hapee/app/core/app_config/app_config.dart';
import 'package:hapee/app/core/database/database.dart';
import 'package:hapee/gopeed/libgopeed_boot.dart';
import 'package:hapee/gopeed_api/api.dart';
import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SentryFlutter.init(
    (options) => options.dsn = String.fromEnvironment('SENTRY_DSN'),
    appRunner: () async {
      await Database.instance.init();
      final appConfig = AppConfig();
      await appConfig.loadStartConfig();
      appConfig.runningPort =
          await LibgopeedBoot.instance.start(appConfig.startConfig);
      Api.init(appConfig.startConfig.network, appConfig.runningAddress(),
          appConfig.startConfig.apiToken);

      runApp(
        ProviderScope(
          child: const App(),
        ),
      );
    },
  );
}
