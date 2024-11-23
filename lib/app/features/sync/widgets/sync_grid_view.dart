import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hapee/app/core/utils/util.dart';
import '../../../core/models/gopeed_models/common/models.dart';
import '../../../core/style/style.dart';
import '../../../core/utils/file_utils.dart';
import '../provider/sync_providers.dart';
import '../extension/status_extension.dart';
import '../../../core/utils/file_icon_helper.dart';
import 'task_actions.dart';

class SyncGridView extends ConsumerWidget {
  const SyncGridView({
    super.key,
    required this.tasks,
  });

  final List<Task> tasks;
  // 卡片尺寸设置
  static const double cardWidth = 300.0;
  static const double cardHeight = 200.0; // 黄金比例 1.5:1
  static const double minCardWidth = 300.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final padding = AppStyle.spacingMedium;

        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(padding),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => TaskCard(task: tasks[index]),
                  childCount: tasks.length,
                ),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: cardWidth,
                  mainAxisExtent: cardHeight,
                  crossAxisSpacing: padding,
                  mainAxisSpacing: padding,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class TaskCard extends ConsumerWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final statusText = task.status.getLocalizedText(context);
    final progress = task.downloadProgress;
    final color = task.status.getStatusColor(context);

    return Container(
      padding: const EdgeInsets.all(AppStyle.spacingMedium),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: GestureDetector(
        onDoubleTap: () async {
          final path = await task.filePath;
          if (context.mounted) {
            await FileUtils.openFile(path, context);
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 头部：图标和状态
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FileIconHelper.getIcon(
                  task.displayName,
                  size: 32,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppStyle.spacingSmall,
                    vertical: AppStyle.spacingTiny,
                  ),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    statusText,
                    style: theme.textTheme.bodySmall?.copyWith(color: color),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppStyle.spacingSmall),

            // 文件名
            Text(
              task.displayName,
              style: theme.textTheme.titleSmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: AppStyle.spacingMedium),

            // 进度条
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.status == Status.done
                      ? Util.formatBytes(task.totalSize)
                      : '${Util.formatBytes(task.downloadedSize)} / ${Util.formatBytes(task.totalSize)}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.textTheme.bodySmall?.color?.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: AppStyle.spacingSmall),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: color.withOpacity(0.1),
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                    minHeight: 6,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppStyle.spacingMedium),

            // 底部信息和操作
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '${Util.formatBytes(task.downloadedSize)} / ${Util.formatBytes(task.totalSize)}',
                      style: theme.textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  TaskActions(
                    task: task,
                    compact: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
