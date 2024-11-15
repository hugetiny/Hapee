// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:hapee/app/features/main/view/error_list_view.dart';
import 'package:hapee/app/features/main/view/sync_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainView extends ConsumerWidget {
  const MainView({super.key});
  static const routeName = '/main';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AdaptiveScaffold(
      transitionDuration: Duration(milliseconds: 0),
      internalAnimations: false,
      smallBreakpoint: const Breakpoint(endWidth: 700),
      mediumBreakpoint: const Breakpoint(beginWidth: 700, endWidth: 1000),
      mediumLargeBreakpoint: const Breakpoint(beginWidth: 1000, endWidth: 1200),
      largeBreakpoint: const Breakpoint(beginWidth: 1200, endWidth: 1600),
      extraLargeBreakpoint: const Breakpoint(beginWidth: 1600),
      useDrawer: false,
      selectedIndex: 0,
      onSelectedIndexChange: (int index) {},
      destinations: const <NavigationDestination>[
        NavigationDestination(
          icon: Icon(Icons.inbox_outlined),
          selectedIcon: Icon(Icons.home),
          label: '同步',
        ),
        NavigationDestination(
          icon: Icon(Icons.article_outlined),
          selectedIcon: Icon(CupertinoIcons.cloud),
          label: '设置',
        ),
        NavigationDestination(
          icon: Icon(Icons.video_call_outlined),
          selectedIcon: Icon(Icons.video_call),
          label: '视频',
        ),
      ],
      body: (_) => Card(
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: SyncView(),
        ),
      ),
      bodyRatio: 0.7,
      secondaryBody: (_) => Card(
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: ErrorListView(),
        ),
      ),
    );
  }
}
