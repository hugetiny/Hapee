// Dart imports:
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:path_provider/path_provider.dart';
import '../models/gopeed_models/common/models.dart';

class Util {
  static final Future<String> storageDir = _initStorageDir();

  static Future<String> _initStorageDir() async {
    return (await getApplicationSupportDirectory()).path;
  }

  static String cleanPath(String path) {
    if (Platform.isWindows) {
      path = path.replaceAll(RegExp(r'\\(?=[\\/])'), "/");
    }

    if (path.startsWith(".")) {
      path = path.substring(1);
    }
    if (path.startsWith("/")) {
      path = path.substring(1);
    }
    return path;
  }

  static String safeDir(String path) {
    if (path == "." || path == "./" || path == ".\\") {
      return "";
    }
    return path;
  }

  static String safePathJoin(List<String> paths) {
    return paths
        .where((e) => e.isNotEmpty)
        .map((e) => safeDir(e))
        .join("/")
        .replaceAll(RegExp(r'//'), "/");
  }

  static String formatBytes(int bytes) {
    if (bytes <= 0) return '0 B';
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB'];
    var i = (log(bytes) / log(1024)).floor();
    i = i.clamp(0, suffixes.length - 1);
    return '${(bytes / pow(1024, i)).toStringAsFixed(1)} ${suffixes[i]}';
  }

  static int parseToBytes(String formattedSize) {
    final regex = RegExp(r'(\d+\.?\d*)\s*([KMGTPEZY]?B)', caseSensitive: false);
    final match = regex.firstMatch(formattedSize);

    if (match == null) return 0;

    final size = double.parse(match.group(1)!);
    final unit = match.group(2)!.toUpperCase();

    const units = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    final power = units.indexOf(unit);

    return (size * pow(1024, power)).round();
  }

  static String getStatusText(Status status) {
    switch (status) {
      case Status.ready:
        return '就绪';
      case Status.running:
        return '下载中';
      case Status.pause:
        return '已暂停';
      case Status.wait:
        return '等待中';
      case Status.error:
        return '错误';
      case Status.done:
        return '已完成';
    }
  }

  static bool get isAndroid => !kIsWeb && Platform.isAndroid;
  static bool get isIOS => !kIsWeb && Platform.isIOS;
  static bool get isMobile => !kIsWeb && (Platform.isAndroid || Platform.isIOS);
  static bool get isDesktop =>
      !kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS);
  static bool get isWindows => !kIsWeb && Platform.isWindows;
  static bool get isMacOS => !kIsWeb && Platform.isMacOS;
  static bool get isLinux => !kIsWeb && Platform.isLinux;
  static bool get isWeb => kIsWeb;

  static bool get supportUnixSocket =>
      !kIsWeb &&
      (Platform.isLinux ||
          Platform.isMacOS ||
          Platform.isAndroid ||
          Platform.isIOS);

  static List<String> textToLines(String text) {
    if (text.isEmpty) {
      return [];
    }
    const ls = LineSplitter();
    return ls.convert(text).where((line) => line.isNotEmpty).toList();
  }
}
