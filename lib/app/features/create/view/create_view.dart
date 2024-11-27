// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hapee/app/core/utils/util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart' as path;

// Project imports:
import '../provider/create_task_provider.dart';
import '../../../core/models/gopeed_models/common/models.dart';
import '../widgets/resolved_resource_dialog.dart';

class CreateView extends HookConsumerWidget {
  const CreateView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createState = ref.watch(createTaskProvider);
    final formKey = useMemoized(() => GlobalKey<FormBuilderState>());
    final currentUrl = useState('');

    // 监听 URL 解析状态，只有 magnet 和 bt 任务需要解析
    final AsyncValue<Resource?> resolveUrlAsync = currentUrl.value.isEmpty
        ? const AsyncData<Resource?>(null)
        : ref.watch(resolveUrlProvider(currentUrl.value));

    // 当解析成功时显示对话框
    useEffect(() {
      if (resolveUrlAsync case AsyncData(value: final resource?)) {
        // 使用 addPostFrameCallback 确保在 Material 上下文中运行
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showDialog<bool>(
            context: context,
            barrierDismissible: false,
            builder: (context) => ResolvedResourceDialog(
              url: currentUrl.value,
              resource: resource,
            ),
          ).then((confirmed) {
            if (confirmed == true) {
              // 用户点击了 Create Task
              final batch = CreateTaskBatch(
                reqs: [
                  Request(
                    url: currentUrl.value,
                    extra: {
                      'selectFiles':
                          createState.selectedFiles[currentUrl.value],
                    },
                  ),
                ],
              );
              ref.read(createTaskBatchProvider(batch).future);
            }
            // 无论用户是否确认，都重置表单和当前 URL
            formKey.currentState?.reset();
            currentUrl.value = '';
          });
        });
      }
      return null;
    }, [resolveUrlAsync]);

    // 创建任务的状态
    final batch = useMemoized(() {
      if (createState.selectedFiles.isEmpty) return null;

      final reqs = createState.resolvedResources.entries
          .where((entry) =>
              (createState.selectedFiles[entry.key]?.isNotEmpty ?? false))
          .map((entry) => Request(
                url: entry.key,
                extra: {
                  'selectFiles': createState.selectedFiles[entry.key],
                },
              ))
          .toList();

      if (reqs.isEmpty) return null;

      return CreateTaskBatch(reqs: reqs);
    }, [createState.selectedFiles, createState.resolvedResources]);

    // 只有当batch非空时才watch createTaskBatchProvider
    final AsyncValue<void> createBatchAsync = batch != null
        ? ref.watch(createTaskBatchProvider(batch))
        : const AsyncData<void>(null);

    // 处理URL提交
    void handleUrlSubmit() {
      if (!formKey.currentState!.saveAndValidate()) return;

      final rawUrl = formKey.currentState!.value['url'] as String;
      if (rawUrl.isEmpty) return;

      // 处理 URL，去除前后空格和可能存在的双引号
      var url = rawUrl.trim();
      if (url.startsWith('"') && url.endsWith('"')) {
        url = url.substring(1, url.length - 1);
      }

      // 检查是否是 magnet 或 bt 链接
      if (url.startsWith('magnet:') || url.endsWith('.torrent')) {
        currentUrl.value = url; // 触发解析
      } else {
        // 直接创建普通下载任务
        final batch = CreateTaskBatch(
          reqs: [
            Request(
              url: url,
              extra: {},
            ),
          ],
        );
        ref.read(createTaskBatchProvider(batch).future);
        formKey.currentState!.reset();
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // URL输入区域
            FormBuilder(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Row(
                children: [
                  Expanded(
                    child: FormBuilderTextField(
                      name: 'url',
                      decoration: const InputDecoration(
                        hintText: 'Enter URL',
                        helperText: 'Support HTTP, Magnet, Torrent links',
                      ),
                      enabled: !resolveUrlAsync.isLoading &&
                          !createBatchAsync.isLoading,
                      onSubmitted: (_) => handleUrlSubmit(),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        (value) {
                          if (value == null || value.isEmpty) return null;

                          // 处理输入值，去除前后空格和可能存在的双引号
                          var trimmed = value.trim();
                          if (trimmed.startsWith('"') &&
                              trimmed.endsWith('"')) {
                            trimmed = trimmed.substring(1, trimmed.length - 1);
                          }

                          if (trimmed.startsWith('magnet:')) {
                            // magnet 链接验证
                            return FormBuilderValidators.compose([
                              FormBuilderValidators.url(
                                protocols: ['magnet'],
                                requireProtocol: true,
                                errorText: FormBuilderLocalizations.of(context)
                                    .urlErrorText,
                              ),
                              (String? value) {
                                if (value == null) return null;
                                final uri = Uri.tryParse(value);
                                if (uri == null) return null;
                                if (!uri.queryParameters.containsKey('xt')) {
                                  return FormBuilderLocalizations.of(context)
                                      .urlErrorText;
                                }
                                return null;
                              },
                            ])(trimmed);
                          } else if (trimmed.endsWith('.torrent')) {
                            // torrent 文件验证
                            // 使用 path.isAbsolute 判断是否为本地文件的绝对路径
                            if (path.isAbsolute(trimmed)) {
                              // 本地文件路径，不需要 URL 验证
                              return null;
                            } else {
                              // 远程 torrent 文件链接验证
                              return FormBuilderValidators.url(
                                protocols: const ['http', 'https'],
                                requireProtocol: true,
                                errorText: FormBuilderLocalizations.of(context)
                                    .urlErrorText,
                              )(trimmed);
                            }
                          } else {
                            // 普通 HTTP(S) 链接验证
                            return FormBuilderValidators.url(
                              protocols: const ['http', 'https'],
                              requireProtocol: true,
                              errorText: FormBuilderLocalizations.of(context)
                                  .urlErrorText,
                            )(trimmed);
                          }
                        },
                      ]),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed:
                        resolveUrlAsync.isLoading || createBatchAsync.isLoading
                            ? null
                            : handleUrlSubmit,
                    child: resolveUrlAsync.when(
                      data: (value) => const Text('Resolve'),
                      error: (error, stack) => const Text('Retry'),
                      loading: () => const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 错误提示
            resolveUrlAsync.when(
              data: (value) => const SizedBox.shrink(),
              error: (error, stack) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Resolve Error'),
                      Text(error.toString()),
                    ],
                  ),
                ),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),

            // 创建任务错误提示
            createBatchAsync.when(
              data: (value) => const SizedBox.shrink(),
              error: (error, stack) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Create Error'),
                      Text(error.toString()),
                    ],
                  ),
                ),
              ),
              loading: () => const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
