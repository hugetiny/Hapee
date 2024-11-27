import 'package:flutter/material.dart';
import 'package:hapee/app/core/style/app_style.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      ),
      // 文字样式
      textTheme: TextTheme(
        displayLarge: TextStyle(
            fontSize: AppStyle.fontSizeTitle, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: AppStyle.fontSizeLarge),
        bodyMedium: TextStyle(fontSize: AppStyle.fontSizeMedium),
        labelLarge: TextStyle(
            fontSize: AppStyle.fontSizeLarge, fontWeight: FontWeight.w500),
      ),
      // 卡片样式
      cardTheme: CardTheme(
        elevation: AppStyle.cardElevation,
        margin: AppStyle.defaultPadding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppStyle.smRadius),
        ),
      ),
      // 按钮样式
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: AppStyle.contentPadding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppStyle.smRadius),
          ),
        ),
      ),
      // 输入框样式
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppStyle.smRadius),
        ),
        contentPadding: AppStyle.contentPadding,
      ),
      // 图标主题
      iconTheme: IconThemeData(
        size: AppStyle.iconSizeMedium,
      ),
      // 进度指示器主题
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        linearMinHeight: AppStyle.progressIndicatorHeight,
      ),
    );
  }

  static ThemeData get darkTheme {
    return lightTheme.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      ),
    );
  }
}
