import 'package:flutter/material.dart';
import 'package:material_file_icon/material_file_icon.dart';

class FileIconHelper {
  static final Map<String, Widget> _cache = {};

  static Widget getIcon(String fileName, {double size = 18}) {
    final extension =
        fileName.contains('.') ? fileName.split('.').last.toLowerCase() : '';

    return _cache.putIfAbsent(extension, () {
      return MFIcon(
        extension.isEmpty ? fileName : 'file.$extension',
        size: size,
      );
    });
  }

  static void clearCache() {
    _cache.clear();
  }
}
