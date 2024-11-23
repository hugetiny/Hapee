import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hapee/l10n/l10n.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import '../../../core/models/gopeed_models/common/models.dart';
import '../provider/sync_providers.dart';
import '../extension/status_extension.dart';
import '../../../core/style/style.dart';

class TaskActions extends ConsumerWidget {
  const TaskActions({
    super.key,
    required this.task,
    this.compact = false,
  });

  final Task task;
  final bool compact; // 紧凑模式，用于表格视图

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = task.status.getStatusColor(context);
    final spacing = compact ? AppStyle.spacingTiny : AppStyle.spacingSmall;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (task.status == Status.running)
          IconButton(
            icon: const Icon(Icons.pause_rounded),
            iconSize: compact ? 22 : null,
            color: color.withOpacity(0.8),
            padding: EdgeInsets.all(spacing),
            constraints: compact ? const BoxConstraints() : null,
            onPressed: () async {
              await ref.read(
                  taskOperationProvider(task.id, TaskOperation.pause).future);
            },
            tooltip: context.l10n.pause_task,
          )
        else if (task.status == Status.pause)
          IconButton(
            icon: const Icon(Icons.play_arrow_rounded),
            iconSize: compact ? 22 : null,
            color: color.withOpacity(0.8),
            padding: EdgeInsets.all(spacing),
            constraints: compact ? const BoxConstraints() : null,
            onPressed: () async {
              await ref.read(
                  taskOperationProvider(task.id, TaskOperation.continue_)
                      .future);
            },
            tooltip: context.l10n.resume_task,
          ),
        if (!compact) SizedBox(width: spacing),
        IconButton(
          icon: const Icon(Icons.delete_rounded),
          iconSize: compact ? 22 : null,
          color: Colors.red.withOpacity(0.8),
          padding: EdgeInsets.all(spacing),
          constraints: compact ? const BoxConstraints() : null,
          onPressed: () async {
            if (context.mounted) {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(context.l10n.delete_task),
                  content: Text(context.l10n.task_remove_record_label),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text(
                          MaterialLocalizations.of(context).cancelButtonLabel),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text(MaterialLocalizations.of(context)
                          .deleteButtonTooltip),
                    ),
                  ],
                ),
              );

              if (confirmed == true) {
                await ref.read(taskOperationProvider(
                        task.id, TaskOperation.delete,
                        force: true)
                    .future);
              }
            }
          },
          tooltip: context.l10n.delete_task,
        ),
        if (!compact) SizedBox(width: spacing),
        IconButton(
          icon: const Icon(Icons.folder_open_rounded),
          iconSize: compact ? 22 : null,
          color: color.withOpacity(0.8),
          padding: EdgeInsets.all(spacing),
          constraints: compact ? const BoxConstraints() : null,
          onPressed: () async {
            final directory = task.dir.isEmpty
                ? (await getDownloadsDirectory())?.path ?? ''
                : task.dir;
            if (directory.isNotEmpty) {
              await OpenFilex.open(directory);
            }
          },
          tooltip: context.l10n.open_folder,
        ),
      ],
    );
  }
}
