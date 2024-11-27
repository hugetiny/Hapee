import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hapee/app/core/utils/util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../provider/create_task_provider.dart';
import '../../../core/models/gopeed_models/common/models.dart';

class ResolvedBTTreeView extends HookConsumerWidget {
  final Resource resource;
  final String url;

  const ResolvedBTTreeView({
    super.key,
    required this.resource,
    required this.url,
  });

  List<fluent.TreeViewItem> _buildTreeItems(
      List<FileInfo> nodes, WidgetRef ref, Set<String> expandedFolders) {
    final createState = ref.watch(createTaskProvider);
    final selectedFiles = createState.selectedFiles[url] ?? [];
    final filterText = createState.filterText.toLowerCase();

    List<fluent.TreeViewItem> items = [];
    final Map<String, List<FileInfo>> groups = {};
    final Map<String, int> folderSizes = {};

    // Group files by directory and calculate folder sizes
    for (final file in nodes) {
      final fullPath = '${file.path}/${file.name}';
      final parts = fullPath.split('/');

      if (parts.length > 1) {
        final dirPath = parts[0];
        // Only include files that match the filter if one is set
        if (filterText.isEmpty || fullPath.toLowerCase().endsWith(filterText)) {
          groups.putIfAbsent(dirPath, () => []).add(file);
          folderSizes.update(dirPath, (value) => value + file.size,
              ifAbsent: () => file.size);
        }
      }
    }

    // Build tree structure
    for (final entry in groups.entries) {
      final currentPath = entry.key;
      final groupFiles = entry.value;
      final folderSize = folderSizes[currentPath] ?? 0;

      // Get all file paths in this directory
      final filesInDir = groupFiles.map((f) => '${f.path}/${f.name}').toList();
      final isFullySelected =
          filesInDir.every((f) => selectedFiles.contains(f));
      final isPartiallySelected =
          filesInDir.any((f) => selectedFiles.contains(f));

      // Only show folders that have files matching the filter
      if (groupFiles.isEmpty && filterText.isNotEmpty) continue;

      // Directory node
      items.add(fluent.TreeViewItem(
        leading: const Icon(Icons.folder, color: Colors.lightBlueAccent),
        content: Row(
          children: [
            Text(currentPath),
            const SizedBox(width: 8),
            Text(
              '(${Util.formatBytes(folderSize)})',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        value: currentPath,
        expanded: expandedFolders.contains(currentPath),
        selected: isFullySelected,
        onExpandToggle: (_, expanded) async {
          if (expanded) {
            expandedFolders.add(currentPath);
          } else {
            expandedFolders.remove(currentPath);
          }
        },
        onInvoked: (_, reason) async {
          if (reason == fluent.TreeViewItemInvokeReason.selectionToggle) {
            // Get all files in this directory
            final filesInDir =
                groupFiles.map((f) => '${f.path}/${f.name}').toList();

            // If all files are selected, deselect all. Otherwise, select all
            final shouldSelect = !isFullySelected;
            ref
                .read(createTaskProvider.notifier)
                .toggleAllFiles(url, shouldSelect);
          }
        },
        children: groupFiles.map((file) {
          final fullPath = '${file.path}/${file.name}';
          return fluent.TreeViewItem(
            leading: const Icon(Icons.insert_drive_file, color: Colors.grey),
            content: Row(
              children: [
                Expanded(child: Text(file.name)),
                Text(
                  Util.formatBytes(file.size),
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            value: fullPath,
            selected: selectedFiles.contains(fullPath),
            onInvoked: (_, reason) async {
              if (reason == fluent.TreeViewItemInvokeReason.selectionToggle) {
                ref
                    .read(createTaskProvider.notifier)
                    .toggleSelectFile(url, fullPath);
              }
            },
          );
        }).toList(),
      ));
    }

    return items;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Use local state for expanded folders
    final expandedFolders = useState<Set<String>>({});

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: fluent.FluentTheme(
        data: fluent.FluentThemeData(
          brightness: Theme.of(context).brightness,
        ),
        child: fluent.TreeView(
          items: _buildTreeItems(resource.files, ref, expandedFolders.value),
          selectionMode: fluent.TreeViewSelectionMode.multiple,
          shrinkWrap: false,
        ),
      ),
    );
  }
}
