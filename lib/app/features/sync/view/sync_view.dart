import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hapee/app/core/style/app_style.dart';
import 'package:hapee/l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../widgets/sync_grid_view.dart';
import '../widgets/sync_table_view.dart';
import '../provider/sync_providers.dart';

class SyncView extends HookConsumerWidget {
  const SyncView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewMode = ref.watch(viewModeNotifierProvider);
    final tasks = ref.watch(tasksProvider);
    final searchController = useTextEditingController();

    final updateSearchQuery = useCallback((String value) {
      ref.read(searchQueryNotifierProvider.notifier).update(value);
    }, []);

    useEffect(() {
      void listener() {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          updateSearchQuery(searchController.text);
        });
      }

      searchController.addListener(listener);
      return () => searchController.removeListener(listener);
    }, [searchController, updateSearchQuery]);

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWideScreen = constraints.maxWidth > AppStyle.tabletWidth;

          final searchField = TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: context.l10n.searchQuery,
              prefixIcon: const Icon(Icons.search),
              border: const OutlineInputBorder(),
            ),
          );

          final toolbarButtons = Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () async {
                  await ref.read(
                      batchTaskOperationProvider(TaskOperation.continue_)
                          .future);
                },
                icon: const Icon(Icons.play_arrow),
                tooltip: context.l10n.task_resume_all_task,
              ),
              IconButton(
                onPressed: () async {
                  await ref.read(
                      batchTaskOperationProvider(TaskOperation.pause).future);
                },
                icon: const Icon(Icons.pause),
                tooltip: context.l10n.task_pause_all_task,
              ),
              IconButton(
                onPressed: () async {
                  final selectedTasks =
                      ref.read(batchTaskOperationNotifierProvider);
                  if (selectedTasks.isNotEmpty) {
                    await ref.read(batchTaskOperationProvider(
                            TaskOperation.delete,
                            force: true)
                        .future);
                  }
                },
                icon: const Icon(Icons.delete_outline),
                tooltip: context.l10n.task_delete_selected_tasks,
              ),
              IconButton(
                icon: const Icon(Icons.add),
                tooltip: context.l10n.create,
                onPressed: () {
                  GoRouter.of(context).pushNamed('create');
                },
              ),
              IconButton(
                icon: Icon(
                  viewMode == ViewMode.grid
                      ? Icons.table_rows
                      : Icons.grid_view,
                ),
                tooltip: viewMode == ViewMode.grid
                    ? context.l10n.table_view
                    : context.l10n.grid_view,
                onPressed: () {
                  ref.read(viewModeNotifierProvider.notifier).toggle();
                },
              ),
              IconButton(
                icon: const Icon(Icons.refresh),
                tooltip: context.l10n.task_refresh_list,
                onPressed: () {
                  ref.invalidate(tasksProvider);
                },
              ),
            ],
          );

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: searchField),
                        if (isWideScreen) const SizedBox(width: 16),
                        if (isWideScreen) toolbarButtons,
                      ],
                    ),
                    if (!isWideScreen) ...[
                      const SizedBox(height: 8),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: toolbarButtons,
                      ),
                    ],
                  ],
                ),
              ),
              Expanded(
                child: tasks.when(
                  data: (taskList) {
                    if (taskList.isEmpty) {
                      return const Center(
                        child: Text('No tasks found'),
                      );
                    }
                    final filteredTasks = ref.watch(filteredTasksProvider);
                    return viewMode == ViewMode.grid
                        ? SyncGridView(tasks: filteredTasks)
                        : SyncTableView(tasks: filteredTasks);
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (error, stack) => Center(
                    child: Text('Error: $error'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
