import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:path_provider/path_provider.dart';

import 'package:path/path.dart' as path;

import 'package:hapee/util/util.dart';

class Util {
  static late final Future<String> storageDir = _initStorageDir();

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

  static String fmtByte(int byte) {
    if (byte < 0) {
      return "0 B";
    } else if (byte < 1024) {
      return "$byte B";
    } else if (byte < 1024 * 1024) {
      return "${(byte / 1024).toStringAsFixed(2)} KB";
    } else if (byte < 1024 * 1024 * 1024) {
      return "${(byte / 1024 / 1024).toStringAsFixed(2)} MB";
    } else {
      return "${(byte / 1024 / 1024 / 1024).toStringAsFixed(2)} GB";
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
