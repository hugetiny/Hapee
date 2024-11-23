import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';

class FileUtils {
  /// Opens a file and shows error message if failed
  static Future<void> openFile(String path, BuildContext context) async {
    final result = await OpenFilex.open(path);
    if (result.type != ResultType.done && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to open file: ${result.message}'),
        ),
      );
    }
  }
}
