import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class AppStyle {
  // Breakpoints for AdaptiveScaffold
  static const mobileBreakpoint = Breakpoint(endWidth: mobileWidth);
  static const tabletBreakpoint =
      Breakpoint(beginWidth: mobileWidth, endWidth: tabletWidth);
  static const desktopBreakpoint =
      Breakpoint(beginWidth: tabletWidth, endWidth: desktopWidth);
  static const largeDesktopBreakpoint =
      Breakpoint(beginWidth: desktopWidth, endWidth: largeDesktopWidth);
  static const ultraWideBreakpoint = Breakpoint(beginWidth: largeDesktopWidth);

  // Responsive layout widths
  static const double mobileWidth = 600; // Mobile breakpoint
  static const double tabletWidth = 800; // Tablet breakpoint
  static const double desktopWidth = 1000; // Desktop breakpoint
  static const double largeDesktopWidth = 1200; // Large desktop breakpoint

  // Base spacing units
  static const double xs = 4.0; // Extra small spacing
  static const double sm = 8.0; // Small spacing
  static const double md = 16.0; // Medium spacing
  static const double lg = 24.0; // Large spacing
  static const double xl = 32.0; // Extra large spacing

  // Padding presets
  static const defaultPadding = EdgeInsets.all(sm);
  static const horizontalPadding = EdgeInsets.symmetric(horizontal: md);
  static const contentPadding = EdgeInsets.symmetric(
    horizontal: md,
    vertical: md * 0.75,
  );

  // Border radius presets
  static const double smRadius = 4.0; // Small radius
  static const double mdRadius = 8.0; // Medium radius
  static const double lgRadius = 12.0; // Large radius
  static const double xlRadius = 16.0; // Extra large radius

  // Font size presets
  static const double fontSizeSmall = 12.0; // Small text
  static const double fontSizeMedium = 14.0; // Medium text
  static const double fontSizeLarge = 16.0; // Large text
  static const double fontSizeTitle = 20.0; // Title text

  // Icon size presets
  static const double iconSizeSmall = 16.0; // Small icons
  static const double iconSizeMedium = 20.0; // Medium icons
  static const double iconSizeLarge = 24.0; // Large icons

  // Grid presets
  static const double gridMaxCrossAxisExtent = 300.0; // Max grid item width
  static const double gridMainAxisSpacing = sm; // Vertical grid spacing
  static const double gridCrossAxisSpacing = sm; // Horizontal grid spacing
  static const double gridChildAspectRatio = 1.5; // Grid item aspect ratio

  // Progress indicator presets
  static const double progressIndicatorHeight = 4.0; // Progress bar height

  // DataGrid presets
  static const double dataGridLineWidth = 0.5; // Grid line width
  static const double dataGridOpacity = 0.3; // Grid opacity
  static const double dataGridOpacityLight = 0.5; // Light grid opacity

  // Card presets
  static const double cardElevation = 1.0; // Card shadow elevation

  // Layout presets
  static const double sizedBoxHeight = 8.0; // Spacer height

  // Text style presets
  static const TextStyle title = TextStyle(
    fontSize: fontSizeTitle,
    fontWeight: FontWeight.bold,
    height: 1.2,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: fontSizeLarge,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );

  static const TextStyle body = TextStyle(
    fontSize: fontSizeMedium,
    height: 1.5,
  );
}
