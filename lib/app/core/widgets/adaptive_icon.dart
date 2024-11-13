import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class AdaptiveIcon extends StatelessWidget {
  final IconData materialIcon;
  final IconData cupertinoIcon;
  final double? size;
  final Color? color;

  const AdaptiveIcon({
    super.key,
    required this.materialIcon,
    required this.cupertinoIcon,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // iOS 使用 Cupertino 风格
    if (Platform.isIOS || Platform.isMacOS) {
      return Icon(
        cupertinoIcon,
        size: size,
        color: color,
      );
    }

    // 其他平台使用 Material 风格
    return Icon(
      materialIcon,
      size: size,
      color: color,
    );
  }
}
