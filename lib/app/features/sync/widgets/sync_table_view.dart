// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hapee/app/features/sync/extension/status_extension.dart';
import 'package:hapee/l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

// Project imports:
import '../../../core/models/gopeed_models/common/models.dart';
import '../../../core/utils/file_icon_helper.dart';
import '../../../core/utils/file_utils.dart';
import '../../../core/utils/util.dart';
import '../provider/sync_providers.dart';
import 'task_actions.dart';

class SyncTableView extends HookConsumerWidget {
  const SyncTableView({
    super.key,
    required this.tasks,
  });

  final List<Task> tasks;

  void _batchDeleteTasks(WidgetRef ref) async {
    final selectedTasks = ref.read(batchTaskOperationNotifierProvider);
    if (selectedTasks.isEmpty) return;

    if (ref.context.mounted) {
      final confirmed = await showDialog<bool>(
        context: ref.context,
        builder: (context) => AlertDialog(
          title: const Text('Delete Tasks'),
          content: Text(
              'Are you sure you want to delete ${selectedTasks.length} tasks?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Delete'),
            ),
          ],
        ),
      );

      if (confirmed == true) {
        await ref.read(
            batchTaskOperationProvider(TaskOperation.delete, force: true)
                .future);
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTasks = ref.watch(batchTaskOperationNotifierProvider);

    final controller = useState(DataGridController());
    final taskDataSource = useMemoized(
      () => TaskDataSource(ref: ref, context: context),
      const [],
    );

    useEffect(() {
      taskDataSource.updateTasks(tasks);
      return null;
    }, [tasks]);

    useEffect(() {
      if (tasks.isNotEmpty) {
        final selectedRows = tasks
            .asMap()
            .entries
            .where((entry) => selectedTasks.contains(entry.value.id))
            .map((entry) => taskDataSource.rows[entry.key])
            .toList();

        controller.value.selectedRows = selectedRows;
      }
      return null;
    }, [tasks, selectedTasks]);

    return SfDataGridTheme(
      data: SfDataGridThemeData(),
      child: SfDataGrid(
        source: taskDataSource,
        allowSorting: true,
        showSortNumbers: false,
        showColumnHeaderIconOnHover: true,
        selectionMode: SelectionMode.multiple,
        columnWidthMode: ColumnWidthMode.auto,
        controller: controller.value,
        onCellDoubleTap: (details) async {
          // 注意：rowIndex 从1开始，0是表头，所以实际数据行数要减1
          final rowIndex = details.rowColumnIndex.rowIndex - 1;
          if (rowIndex >= 0) {
            final task =
                taskDataSource.getTaskFromRow(taskDataSource.rows[rowIndex]);
            final path = await task.filePath;
            if (context.mounted) {
              await FileUtils.openFile(path, context);
            }
          }
        },
        onSelectionChanged: (addedRows, removedRows) {
          for (final row in [...addedRows, ...removedRows]) {
            final task = taskDataSource.getTaskFromRow(row);
            ref
                .read(batchTaskOperationNotifierProvider.notifier)
                .toggleTask(task.id);
          }
        },
        columns: taskDataSource._buildColumns(),
      ),
    );
  }
}

class TaskDataSource extends DataGridSource {
  TaskDataSource({
    required this.ref,
    required this.context,
  });

  final BuildContext context;
  final WidgetRef ref;
  List<Task> _tasks = [];
  List<DataGridRow> _dataGridRows = [];

  String? _sortColumnName;
  DataGridSortDirection? _sortDirection;

  @override
  List<DataGridRow> get rows => _dataGridRows;

  void updateTasks(List<Task> tasks) {
    _tasks = tasks;
    if (_sortColumnName != null && _sortDirection != null) {
      _sortTasks();
    }
    _buildDataGridRows();
    notifyListeners();
  }

  void _sortTasks() {
    _tasks.sort((a, b) {
      switch (_sortColumnName) {
        case 'name':
          return _sortDirection == DataGridSortDirection.ascending
              ? a.displayName.compareTo(b.displayName)
              : b.displayName.compareTo(a.displayName);
        case 'size':
          return _sortDirection == DataGridSortDirection.ascending
              ? a.totalSize.compareTo(b.totalSize)
              : b.totalSize.compareTo(a.totalSize);
        case 'speed':
          return _sortDirection == DataGridSortDirection.ascending
              ? a.downloadSpeed.compareTo(b.downloadSpeed)
              : b.downloadSpeed.compareTo(a.downloadSpeed);
        default:
          return 0;
      }
    });
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final cells = row.getCells();
    // final task = getTaskFromRow(row);

    return DataGridRowAdapter(
      cells: cells.map<Widget>((cell) {
        final value = cell.value;
        if (value is! Widget) {
          return Container();
        }
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          alignment: _getAlignment(cell.columnName),
          child: value,
        );
      }).toList(),
    );
  }

  Alignment _getAlignment(String? columnName) {
    switch (columnName) {
      case 'name':
        return Alignment.centerLeft;
      case 'actions':
        return Alignment.center;
      default:
        return Alignment.centerRight;
    }
  }

  List<GridColumn> _buildColumns() {
    return [
      GridColumn(
        columnName: 'name',
        columnWidthMode: ColumnWidthMode.fill,
        autoFitPadding: const EdgeInsets.all(2.0),
        label: Container(
          alignment: Alignment.center,
          child: Text(
            context.l10n.task_name,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      GridColumn(
        columnName: 'speed',
        columnWidthMode: ColumnWidthMode.auto,
        width: 80,
        // autoFitPadding: const EdgeInsets.all(2.0),
        label: Container(
          alignment: Alignment.centerRight,
          child: Text(
            context.l10n.task_speed,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      GridColumn(
        columnName: 'size',
        columnWidthMode: ColumnWidthMode.auto,
        width: 80,
        // autoFitPadding: const EdgeInsets.all(2.0),
        label: Container(
          alignment: Alignment.centerRight,
          child: Text(
            context.l10n.task_size,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      GridColumn(
        columnName: 'actions',
        columnWidthMode: ColumnWidthMode.auto,
        width: 80,
        autoFitPadding: const EdgeInsets.all(2.0),
        label: Container(
          alignment: Alignment.center,
          child: Text(
            context.l10n.actions,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    ];
  }

  DataGridRow _buildRow(Task task) {
    return DataGridRow(cells: [
      DataGridCell<Widget>(
        columnName: 'name',
        value: StatusIndicator(
          task: task,
          child: Row(
            children: [
              const SizedBox(width: 8),
              FileIconHelper.getIcon(task.displayName),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  task.displayName,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
      DataGridCell<Widget>(
        columnName: 'speed',
        value: Text(
          task.status == Status.running
              ? '${Util.formatBytes(task.downloadSpeed)}/s'
              : '-',
          textAlign: TextAlign.right,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      DataGridCell<Widget>(
        columnName: 'size',
        value: Text(
          task.status == Status.done
              ? Util.formatBytes(task.totalSize)
              : '${Util.formatBytes(task.downloadedSize)} / ${Util.formatBytes(task.totalSize)}',
          textAlign: TextAlign.right,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      DataGridCell<Widget>(
        columnName: 'actions',
        value: TaskActions(
          task: task,
          compact: true,
        ),
      ),
    ]);
  }

  void _buildDataGridRows() {
    _dataGridRows = _tasks.map((task) => _buildRow(task)).toList();
  }

  Task getTaskFromRow(DataGridRow row) {
    final name = (row
            .getCells()
            .firstWhere((cell) => cell.columnName == 'name')
            .value as StatusIndicator)
        .task;
    return _tasks.firstWhere((task) => task.displayName == name.displayName);
  }

  void _pauseTask(Task task) async {
    await ref.read(taskOperationProvider(task.id, TaskOperation.pause).future);
  }

  void _continueTask(Task task) async {
    await ref
        .read(taskOperationProvider(task.id, TaskOperation.continue_).future);
  }

  void _deleteTask(Task task) async {
    await ref.read(taskOperationProvider(task.id, TaskOperation.delete).future);
  }

  @override
  Future<void> sort() async {
    if (sortedColumns.isEmpty) {
      return;
    }

    final sortColumn = sortedColumns.first;
    _sortColumnName = sortColumn.name;
    _sortDirection = sortColumn.sortDirection;

    _sortTasks();
    _buildDataGridRows();
    notifyListeners();
  }

  @override
  int compare(DataGridRow? a, DataGridRow? b, SortColumnDetails sortColumn) {
    if (a == null || b == null) {
      return 0;
    }

    _sortColumnName = sortColumn.name;
    _sortDirection = sortColumn.sortDirection;

    final aTask = getTaskFromRow(a);
    final bTask = getTaskFromRow(b);
    final multiplier =
        sortColumn.sortDirection == DataGridSortDirection.ascending ? 1 : -1;

    switch (sortColumn.name) {
      case 'name':
        return aTask.displayName.compareTo(bTask.displayName) * multiplier;
      case 'size':
        return (aTask.totalSize).compareTo(bTask.totalSize) * multiplier;
      case 'speed':
        return aTask.downloadSpeed.compareTo(bTask.downloadSpeed) * multiplier;
      default:
        return 0;
    }
  }
}

class StatusIndicator extends StatelessWidget {
  const StatusIndicator({
    super.key,
    required this.task,
    required this.child,
  });

  final Task task;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final color = task.status.getStatusColor(context);
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        Expanded(child: child),
      ],
    );
  }
}
