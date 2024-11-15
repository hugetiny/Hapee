// Dart imports:
import 'dart:async';
import 'dart:ui';

// Package imports:
import 'package:flutter_background_service/flutter_background_service.dart';

class BackgroundServiceHelper {
  static Future<void> initializeService() async {
    final service = FlutterBackgroundService();

    await service.configure(
      iosConfiguration: IosConfiguration(
        autoStart: true,
        onForeground: onStart,
        onBackground: onIosBackground,
      ),
      androidConfiguration: AndroidConfiguration(
          onStart: onStart,
          autoStart: true,
          isForegroundMode: true,
          notificationChannelId: 'my_service',
          initialNotificationTitle: '服务已启动',
          initialNotificationContent: '应用正在后台运行...',
          foregroundServiceTypes: [AndroidForegroundType.dataSync,AndroidForegroundType.mediaPlayback]),
    );
    await service.startService();
  }

  @pragma('vm:entry-point')
  static Future<bool> onIosBackground(ServiceInstance service) async {
    return true;
  }

  @pragma('vm:entry-point')
  static void onStart(ServiceInstance service) async {
    DartPluginRegistrant.ensureInitialized();
  }
}
