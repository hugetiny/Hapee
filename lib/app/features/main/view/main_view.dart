import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class MainView extends ConsumerWidget {
  const MainView({super.key});
  static const routeName = '/main';
  // 添加 children 列表
  final List<Widget> children = const [
    Card(child: SizedBox(height: 100, child: Center(child: Text('项目 1')))),
    Card(child: SizedBox(height: 100, child: Center(child: Text('项目 2')))),
    Card(child: SizedBox(height: 100, child: Center(child: Text('项目 3')))),
    // ... 可以添加更多项目
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Define the children to display within the body at different breakpoints.
    final List<Widget> children = <Widget>[
      for (int i = 0; i < 10; i++)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: const Color.fromARGB(255, 255, 201, 197),
            height: 400,
          ),
        )
    ];
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
          label: '首页',
        ),
        NavigationDestination(
          icon: Icon(Icons.article_outlined),
          selectedIcon: Icon(CupertinoIcons.cloud),
          label: 'Articles',
        ),
        NavigationDestination(
          icon: Icon(Icons.chat_outlined),
          selectedIcon: Icon(Icons.chat),
          label: 'Chat',
        ),
        NavigationDestination(
          icon: Icon(Icons.video_call_outlined),
          selectedIcon: Icon(Icons.video_call),
          label: 'Video',
        ),
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Inbox',
        ),
      ],
      smallBody: (_) => ListView.builder(
        itemCount: children.length,
        itemBuilder: (_, int idx) => children[idx],
      ),
      body: (_) => GridView.count(crossAxisCount: 2, children: children),
      mediumLargeBody: (_) =>
          GridView.count(crossAxisCount: 3, children: children),
      largeBody: (_) => GridView.count(crossAxisCount: 4, children: children),
      extraLargeBody: (_) =>
          GridView.count(crossAxisCount: 5, children: children),

       bodyRatio: 0.7,
      smallSecondaryBody: AdaptiveScaffold.emptyBuilder,
      secondaryBody: (_) => Container(
        color: const Color.fromARGB(255, 234, 158, 192),
      ),
      mediumLargeSecondaryBody: (_) => Container(
        color: const Color.fromARGB(255, 234, 158, 192),
      ),
      largeSecondaryBody: (_) => Container(
        color: const Color.fromARGB(255, 234, 158, 192),
      ),
      extraLargeSecondaryBody: (_) => Container(
        color: const Color.fromARGB(255, 234, 158, 192),
      ),
    );
  }
}
