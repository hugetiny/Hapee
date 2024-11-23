// Flutter imports:
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:hapee/app/features/sync/view/sync_view.dart';
import 'package:hapee/app/core/style/style.dart';

class MainView extends HookConsumerWidget {
  const MainView({super.key});
  static const routeName = '/main';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSecondaryBodyVisible = useState(true);

    return AdaptiveScaffold(
      transitionDuration: const Duration(milliseconds: 0),
      internalAnimations: false,
      smallBreakpoint: AppBreakpoints.small,
      mediumBreakpoint: AppBreakpoints.medium,
      mediumLargeBreakpoint: AppBreakpoints.mediumLarge,
      largeBreakpoint: AppBreakpoints.large,
      extraLargeBreakpoint: AppBreakpoints.extraLarge,
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
          selectedIcon: Icon(Icons.settings),
          label: '设置',
        ),
        NavigationDestination(
          icon: Icon(Icons.video_call_outlined),
          selectedIcon: Icon(Icons.video_call),
          label: '视频',
        ),
      ],
      body: (context) => Card(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    isSecondaryBodyVisible.value
                        ? Icons.keyboard_double_arrow_right_rounded
                        : Icons.keyboard_double_arrow_left_rounded,
                  ),
                  onPressed: () {
                    isSecondaryBodyVisible.value =
                        !isSecondaryBodyVisible.value;
                  },
                ),
              ],
            ),
            const Expanded(
              child: Padding(
                padding: AppStyle.defaultPadding,
                child: SyncView(),
              ),
            ),
          ],
        ),
      ),
      bodyRatio: 0.7,
      secondaryBody: isSecondaryBodyVisible.value
          ? (context) => const Card(
                child: Padding(
                  padding: AppStyle.defaultPadding,
                  // child: ErrorListView(),
                ),
              )
          : null,
    );
  }
}
