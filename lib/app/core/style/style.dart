import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class AppBreakpoints {
  // 断点定义
  static const small = Breakpoint(endWidth: smallWidth);
  static const medium =
      Breakpoint(beginWidth: smallWidth, endWidth: mediumWidth);
  static const mediumLarge =
      Breakpoint(beginWidth: mediumWidth, endWidth: mediumLargeWidth);
  static const large =
      Breakpoint(beginWidth: mediumLargeWidth, endWidth: largeWidth);
  static const extraLarge = Breakpoint(beginWidth: largeWidth);

  // 断点宽度
  static const double smallWidth = 600;
  static const double mediumWidth = 800;
  static const double mediumLargeWidth = 1000;
  static const double largeWidth = 1200;
}

class AppStyle {
  // Spacing
  static const spacingTiny = 4.0;
  static const spacingSmall = 8.0;
  static const spacingMedium = 16.0;
  static const spacingLarge = 24.0;
  static const spacingXLarge = 32.0;

  // Padding
  static const defaultPadding = EdgeInsets.all(spacingSmall);
  static const horizontalPadding =
      EdgeInsets.symmetric(horizontal: spacingMedium);
  static const contentPadding = EdgeInsets.symmetric(
    horizontal: spacingMedium,
    vertical: spacingMedium * 0.75,
  );

  // Border Radius
  static const defaultBorderRadius = 8.0;

  // Font Sizes
  static const fontSizeSmall = 12.0;
  static const fontSizeMedium = 14.0;
  static const fontSizeLarge = 16.0;
  static const fontSizeTitle = 20.0;

  // Icon Sizes
  static const iconSizeSmall = 16.0;
  static const iconSizeMedium = 20.0;
  static const iconSizeLarge = 24.0;

  // Grid
  static const gridMaxCrossAxisExtent = 300.0;
  static const gridMainAxisSpacing = spacingSmall;
  static const gridCrossAxisSpacing = spacingSmall;
  static const gridChildAspectRatio = 1.5;

  // Progress Indicator
  static const progressIndicatorHeight = 4.0;

  // DataGrid
  static const dataGridLineWidth = 0.5;
  static const dataGridOpacity = 0.3;
  static const dataGridOpacityLight = 0.5;

  // Card
  static const cardElevation = 1.0;

  // Layout
  static const sizedBoxHeight = 8.0;
}
