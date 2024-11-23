import 'dart:io';

void main() {
  // 项目根目录
  final projectRoot = 'C:/Users/Administrator/StudioProjects/hapee_next/lib';

  // 项目名称
  final packageName = 'hapee';

  // 遍历项目中的所有 Dart 文件
  Directory(projectRoot).listSync(recursive: true).forEach((entity) {
    if (entity is File && entity.path.endsWith('.dart')) {
      final file = entity;
      final content = file.readAsStringSync();

      // 使用正则表达式替换相对路径为 package 路径
      final newContent = content.replaceAllMapped(
        RegExp(r"import\s+'(\.\./)+(.+?);"),
        (match) => "import 'package:$packageName/${match.group(2)};",
      );

      // 如果内容有变化，写回文件
      if (newContent != content) {
        file.writeAsStringSync(newContent);
        print('Updated imports in: ${file.path}');
      }
    }
  });
}
