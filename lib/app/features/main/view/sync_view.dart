import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../../core/widgets/adaptive_icon.dart';
import '../../../core/style/style.dart';
import '../providers/sync_providers.dart';
import '../model/gopeed_models/common/models.dart';
import '../../../../gopeed_api/api.dart';
import '../../../core/widgets/error_view.dart';
import 'package:material_file_icon/material_file_icon.dart';

class TaskDataSource extends DataGridSource {
  TaskDataSource(this.tasks, this.onSortChanged) {
    _dataGridRows = tasks.map<DataGridRow>((task) {
      final size = task.meta.res?.size ?? task.size ?? 0;
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'task', value: task.displayName),
        DataGridCell<int>(columnName: 'size', value: size),
        DataGridCell<String>(
            columnName: 'speed',
            value: '${_formatSize(task.progress.speed)}/s'),
        DataGridCell<String>(
            columnName: 'status', value: _getStatusText(task.status)),
        DataGridCell<String>(columnName: 'actions', value: task.id),
      ]);
    }).toList();
  }

  final List<Task> tasks;
  final void Function(List<SortColumnDetails>) onSortChanged;
  List<DataGridRow> _dataGridRows = [];

  @override
  Future<void> sort() async {
    super.sort();
    onSortChanged(sortedColumns);
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        switch (cell.columnName) {
          case 'task':
            final task =
                tasks.firstWhere((t) => t.displayName == cell.value as String);
            return Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const SizedBox(width: AppStyle.spacingSmall),
                  MFIcon(
                    task.displayName,
                    size: AppStyle.iconSizeMedium,
                  ),
                  const SizedBox(width: AppStyle.spacingSmall),
                  Text(
                    task.displayName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            );
          case 'size':
            return Container(
              alignment: Alignment.centerRight,
              child: Text(
                _formatSize(cell.value as int),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            );
          case 'speed':
            return Container(
              alignment: Alignment.centerRight,
              child: Text(
                cell.value.toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            );
          case 'status':
            return Container(
              alignment: Alignment.centerRight,
              child: Text(
                cell.value as String,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            );
          case 'actions':
            final taskId = cell.value as String;
            final task = tasks.firstWhere((t) => t.id == taskId);
            return Container(
              alignment: Alignment.centerRight,
              child: Consumer(
                builder: (context, ref, _) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (task.status == Status.running)
                      IconButton(
                        icon: Icon(Icons.pause, size: AppStyle.iconSizeMedium),
                        onPressed: () async {
                          await ref.read(pauseTaskProvider(taskId).future);
                          ref.invalidate(tasksProvider);
                        },
                      ),
                    if (task.status == Status.pause)
                      IconButton(
                        icon: Icon(Icons.play_arrow,
                            size: AppStyle.iconSizeMedium),
                        onPressed: () async {
                          await ref.read(continueTaskProvider(taskId).future);
                          ref.invalidate(tasksProvider);
                        },
                      ),
                    IconButton(
                      icon: Icon(Icons.delete_outline,
                          size: AppStyle.iconSizeMedium),
                      onPressed: () async {
                        await ref
                            .read(deleteTaskProvider(taskId, false).future);
                        ref.invalidate(tasksProvider);
                      },
                    ),
                  ],
                ),
              ),
            );
          default:
            return Container(
              alignment: Alignment.center,
              child: Text(
                cell.value.toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            );
        }
      }).toList(),
    );
  }

  @override
  Future<void> handleLoadMoreRows() async {
    notifyListeners();
  }

  @override
  Future<void> handleRefresh() async {
    notifyListeners();
  }

  void _pauseTask(String id) {
    Api.taskApi.pauseTask(id);
  }

  void _continueTask(String id) {
    Api.taskApi.continueTask(id);
  }

  void _deleteTask(String id) {
    Api.taskApi.deleteTask(id, false);
  }

  String _formatSize(num bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(2)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
  }

  String _getStatusText(Status status) {
    switch (status) {
      case Status.ready:
        return '就绪';
      case Status.running:
        return '下载中';
      case Status.pause:
        return '已暂停';
      case Status.wait:
        return '等待中';
      case Status.error:
        return '错误';
      case Status.done:
        return '已完成';
    }
  }
}

class SyncView extends HookConsumerWidget {
  const SyncView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataGridController = useMemoized(() => DataGridController(), []);
    final searchQuery = useState('');
    final isGridView = useState(false);
    final tasks = ref.watch(tasksProvider);
    final focusNode = useFocusNode();

    // 保存排序和选择状态
    final selectedRows = useState<List<DataGridRow>>([]);
    final sortedColumns = useState<List<SortColumnDetails>>([]);

    Widget buildTableView(List<Task> tasks, DataGridController controller) {
      final source = TaskDataSource(
        tasks,
        (columns) => sortedColumns.value = columns,
      );

      // 恢复排序状态
      source.sortedColumns.clear();
      source.sortedColumns.addAll(sortedColumns.value);
      if (sortedColumns.value.isNotEmpty) {
        source.sort();
      }

      return SfDataGridTheme(
        data: SfDataGridThemeData(
          headerColor: Theme.of(context).colorScheme.surfaceVariant,
          gridLineColor: Theme.of(context)
              .dividerColor
              .withOpacity(AppStyle.dataGridOpacityLight),
          gridLineStrokeWidth: AppStyle.dataGridLineWidth,
          rowHoverColor: Theme.of(context).hoverColor,
          selectionColor: Theme.of(context)
              .colorScheme
              .primaryContainer
              .withOpacity(AppStyle.dataGridOpacity),
        ),
        child: SfDataGrid(
          source: source,
          controller: controller,
          allowSorting: true,
          // allowMultiColumnSorting: true,
          showCheckboxColumn: false,
          selectionMode: SelectionMode.multiple,
          onSelectionChanged: (addedRows, removedRows) {
            selectedRows.value = [...controller.selectedRows];
          },
          onSelectionChanging: (addedRows, removedRows) => true,
          columnWidthMode: ColumnWidthMode.fill,
          columns: [
            GridColumn(
              columnName: 'task',
              label: const Text('任务'),
            ),
            GridColumn(
              columnName: 'size',
              columnWidthMode: ColumnWidthMode.auto,
              label: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  '大小',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppStyle.fontSizeMedium,
                  ),
                ),
              ),
            ),
            GridColumn(
              columnName: 'speed',
              columnWidthMode: ColumnWidthMode.auto,
              label: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  '速度',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppStyle.fontSizeMedium,
                  ),
                ),
              ),
            ),
            GridColumn(
              columnName: 'status',
              columnWidthMode: ColumnWidthMode.auto,
              label: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  '状态',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppStyle.fontSizeMedium,
                  ),
                ),
              ),
            ),
            GridColumn(
              columnName: 'actions',
              allowSorting: false,
              width: 100,
              label: Container(
                alignment: Alignment.center,
                child: Text(
                  '操作',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppStyle.fontSizeMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    // 监听数据变化,恢复状态
    useEffect(() {
      if (tasks.hasValue) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          // 恢复选择状态
          if (selectedRows.value.isNotEmpty) {
            dataGridController.selectedRows.clear();
            dataGridController.selectedRows.addAll(selectedRows.value);
            dataGridController.notifyListeners();
          }
        });
      }
      return null;
    }, [tasks.value]);

    return Focus(
      focusNode: focusNode,
      onKeyEvent: (_, event) => KeyEventResult.ignored,
      child: Column(
        children: [
          _SearchBar(onChanged: (value) => searchQuery.value = value),
          _Toolbar(
            isGridView: isGridView.value,
            onViewToggle: () => isGridView.value = !isGridView.value,
          ),
          Expanded(
            child: tasks.when(
              data: (taskList) {
                final filteredTasks = taskList
                    .where((task) => task.displayName
                        .toLowerCase()
                        .contains(searchQuery.value.toLowerCase()))
                    .toList();

                return isGridView.value
                    ? _buildGridView(filteredTasks)
                    : buildTableView(filteredTasks, dataGridController);
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => ErrorView(
                error: error,
                stackTrace: stackTrace,
                onRetry: () => ref.invalidate(tasksProvider),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridView(List<Task> tasks) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: AppStyle.gridMaxCrossAxisExtent,
        mainAxisSpacing: AppStyle.gridMainAxisSpacing,
        crossAxisSpacing: AppStyle.gridCrossAxisSpacing,
        childAspectRatio: AppStyle.gridChildAspectRatio,
      ),
      itemCount: tasks.length,
      itemBuilder: (context, index) => _TaskCard(task: tasks[index]),
    );
  }
}

class _SearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const _SearchBar({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: '搜索下载任务...',
        prefixIcon: Icon(Icons.search, size: AppStyle.iconSizeMedium),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppStyle.defaultBorderRadius),
        ),
        filled: true,
      ),
    );
  }
}

class _TaskCard extends StatelessWidget {
  final Task task;

  const _TaskCard({required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppStyle.cardElevation,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppStyle.defaultBorderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.displayName,
            style: TextStyle(
              fontSize: AppStyle.fontSizeLarge,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: AppStyle.spacingMedium),
          LinearProgressIndicator(
            value: task.downloadProgress,
            minHeight: AppStyle.progressIndicatorHeight,
            backgroundColor: Colors.transparent,
          ),
          SizedBox(height: AppStyle.spacingMedium),
          Text(
            '大小: ${_formatSize(task.meta.res?.size ?? task.size ?? 0)}',
            style: TextStyle(fontSize: AppStyle.fontSizeMedium),
          ),
          Text(
            '速度: ${_formatSize(task.progress.speed)}/s',
            style: TextStyle(fontSize: AppStyle.fontSizeMedium),
          ),
          Text(
            '状态: ${task.status.name}',
            style: TextStyle(fontSize: AppStyle.fontSizeMedium),
          ),
          _TaskActions(task: task),
        ],
      ),
    );
  }

  String _formatSize(num bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(2)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
  }
}

class _TaskActions extends ConsumerWidget {
  final Task task;

  const _TaskActions({required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        if (task.status == Status.running)
          IconButton(
            icon: Icon(Icons.pause, size: AppStyle.iconSizeMedium),
            onPressed: () => ref.read(pauseTaskProvider(task.id)),
          ),
        if (task.status == Status.pause)
          IconButton(
            icon: Icon(Icons.play_arrow, size: AppStyle.iconSizeMedium),
            onPressed: () => ref.read(continueTaskProvider(task.id)),
          ),
        IconButton(
          icon: Icon(Icons.delete_outline, size: AppStyle.iconSizeMedium),
          onPressed: () => ref.read(deleteTaskProvider(task.id, false)),
        ),
      ],
    );
  }
}

class _Toolbar extends ConsumerWidget {
  final bool isGridView;
  final VoidCallback onViewToggle;

  const _Toolbar({
    required this.isGridView,
    required this.onViewToggle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(tasksProvider);

    return Row(
      children: [
        IconButton(
          icon: Icon(isGridView ? Icons.grid_view : Icons.table_rows_outlined),
          onPressed: onViewToggle,
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => _showCreateTaskDialog(context, ref),
        ),
        IconButton(
          icon: const Icon(Icons.playlist_add),
          onPressed: () => _showBatchCreateDialog(context, ref),
        ),
        tasks.when(
          data: (taskList) => taskList.isNotEmpty
              ? Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.play_arrow),
                      onPressed: () => ref.read(
                          continueTasksProvider(statuses: [Status.pause])),
                    ),
                    IconButton(
                      icon: const Icon(Icons.pause),
                      onPressed: () => ref
                          .read(pauseTasksProvider(statuses: [Status.running])),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () => _showBatchDeleteDialog(context, ref),
                    ),
                  ],
                )
              : const SizedBox(),
          loading: () => const SizedBox(),
          error: (_, __) => const SizedBox(),
        ),
      ],
    );
  }

  void _showCreateTaskDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('创建下载任务'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: '下载地址',
                hintText: '输入HTTP链接或磁力链接',
              ),
              onSubmitted: (url) {
                if (url.isNotEmpty) {
                  ref.read(createTaskProvider(
                    CreateTask(req: Request(url: url)),
                  ));
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  void _showBatchCreateDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('批量创建下载任务'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: '下载地址',
                hintText: '每行输入一个下载地址',
              ),
              onSubmitted: (urls) async {
                final urlList = urls
                    .split('\n')
                    .where((url) => url.trim().isNotEmpty)
                    .toList();

                if (urlList.isNotEmpty) {
                  await ref.read(createTaskBatchProvider(
                    CreateTaskBatch(
                      reqs: urlList
                          .map((url) => Request(url: url.trim()))
                          .toList(),
                    ),
                  ).future);
                  ref.invalidate(tasksProvider);
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  void _showBatchDeleteDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('删除全部任务'),
        content: const Text('确定要删除所有任务吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () async {
              await ref.read(deleteTasksProvider().future);
              ref.invalidate(tasksProvider);
              Navigator.pop(context);
            },
            child: const Text('确定', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
