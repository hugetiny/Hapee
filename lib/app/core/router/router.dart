// Package imports:
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../../features/main/view/main_view.dart';
import '../../features/sync/view/sync_view.dart';
import '../../features/create/view/create_view.dart';

///
/// for getting routers that are present in the app
///
final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: '/sync',
      routes: [
        ShellRoute(
          builder: (context, state, child) => MainView(child: child),
          routes: [
            GoRoute(
              path: '/sync',
              name: 'sync',
              builder: (context, state) => const SyncView(),
            ),
            GoRoute(
              path: '/create',
              name: 'create',
              builder: (context, state) => const CreateView(),
            ),
            // TODO: Add other main routes (settings, lab) here
          ],
        ),
      ],
    );
  },
);
