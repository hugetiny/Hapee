import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hapee/app/features/main/providers/error_providers.dart';

class ErrorListView extends ConsumerWidget {
  const ErrorListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errors = ref.watch(errorLogNotifierProvider);

    return Material(
      child: Column(
        children: [
          ListTile(
            title: const Text('错误日志'),
            trailing: errors.isEmpty
                ? null
                : IconButton(
                    icon: const Icon(Icons.clear_all),
                    onPressed: () => ref
                        .read(errorLogNotifierProvider.notifier)
                        .clear(),
                  ),
          ),
          Expanded(
            child: errors.isEmpty
                ? const Center(child: Text('没有错误信息'))
                : ListView.builder(
                    itemCount: errors.length,
                    itemBuilder: (context, index) {
                      final error = errors[index];
                      return _ErrorListTile(
                        error: error.message,
                        timestamp: error.timestamp,
                        stackTrace: error.stackTrace,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _ErrorListTile extends StatelessWidget {
  const _ErrorListTile({
    required this.error,
    required this.timestamp,
    required this.stackTrace,
  });

  final String error;
  final DateTime timestamp;
  final StackTrace stackTrace;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(error),
      subtitle: Text(timestamp.toLocal().toString()),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SelectableText.rich(
            TextSpan(
              children: [
                const TextSpan(text: '错误信息：\n'),
                TextSpan(text: '$error\n\n'),
                const TextSpan(text: '堆栈跟踪：\n'),
                TextSpan(text: stackTrace.toString()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
