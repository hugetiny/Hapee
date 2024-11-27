// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:hapee/l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:hapee/app/core/style/app_style.dart';

class MainView extends HookConsumerWidget {
  const MainView({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = GoRouterState.of(context).uri.path;
    final selectedIndex = switch (location) {
      '/sync' => 0,
      '/settings' => 1,
      '/lab' => 2,
      _ => 0,
    };

    return AdaptiveScaffold(
      transitionDuration: const Duration(milliseconds: 0),
      internalAnimations: false,
      smallBreakpoint: AppStyle.mobileBreakpoint,
      mediumBreakpoint: AppStyle.tabletBreakpoint,
      mediumLargeBreakpoint: AppStyle.desktopBreakpoint,
      largeBreakpoint: AppStyle.largeDesktopBreakpoint,
      extraLargeBreakpoint: AppStyle.ultraWideBreakpoint,
      useDrawer: false,
      selectedIndex: selectedIndex,
      onSelectedIndexChange: (index) {
        switch (index) {
          case 0:
            context.go('/sync');
          case 1:
            context.go('/settings');
          case 2:
            context.go('/lab');
        }
      },
      destinations: <NavigationDestination>[
        NavigationDestination(
          icon: const Icon(Icons.sync_outlined),
          selectedIcon: const Icon(Icons.sync),
          label: context.l10n.download,
        ),
        NavigationDestination(
          icon: const Icon(Icons.settings_outlined),
          selectedIcon: const Icon(Icons.settings),
          label: context.l10n.setting,
        ),
        NavigationDestination(
          icon: const Icon(Icons.science_outlined),
          selectedIcon: const Icon(Icons.science),
          label: context.l10n.preferences_lab,
        ),
      ],
      body: (context) => Card(
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(),
        child: child,
      ),
    );
  }
}
