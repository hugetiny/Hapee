// // Package imports:
// import 'package:flutter_test/flutter_test.dart';

// // Project imports:
// import 'package:hapee/gopeed_api/api.dart';
// import 'package:hapee/gopeed_models/models.dart';

// void main() {
//   group('Download Workflow Integration Tests', () {
//     setUpAll(() {
//       Api.init('tcp', '127.0.0.1:9999', '');
//     });

//     test('Complete download workflow', () async {
//       // 1. 检查服务器状态
//       final serverInfo = await Api.infoApi.getInfo();
//       expect(serverInfo.version, isNotEmpty);

//       // 2. 获取并更新配置
//       final config = await Api.configApi.getConfig();
//       await Api.configApi.putConfig(config.copyWith(
//         maxRunning: 3,
//         downloadDir: '/test-downloads',
//       ));

//       // 3. 解析下载链接
//       final request = Request(url: 'https://example.com/test.zip');
//       final resolveResult = await Api.resolveApi.resolve(request);
//       expect(resolveResult.res.files, isNotEmpty);

//       // 4. 创建下载任务
//       final taskId = await Api.taskApi.createTask(CreateTask(
//         rid: resolveResult.id,
//         opt: Options(
//           name: resolveResult.res.files.first.name,
//           path: '/test-downloads',
//         ),
//       ));

//       // 5. 监控下载进度
//       bool isCompleted = false;
//       int retryCount = 0;
//       const maxRetries = 10;

//       while (!isCompleted && retryCount < maxRetries) {
//         final tasks = await Api.taskApi.getTasks([Status.running, Status.done]);
//         final task = tasks.firstWhere((t) => t.id == taskId);

//         if (task.status == Status.done) {
//           isCompleted = true;
//         } else {
//           // 测试暂停/继续功能
//           await Api.taskApi.pauseTask(taskId);
//           final pausedTasks = await Api.taskApi.getTasks([Status.pause]);
//           expect(pausedTasks.any((t) => t.id == taskId), isTrue);

//           await Api.taskApi.continueTask(taskId);
//           final runningTasks = await Api.taskApi.getTasks([Status.running]);
//           expect(runningTasks.any((t) => t.id == taskId), isTrue);

//           retryCount++;
//           await Future.delayed(const Duration(seconds: 1));
//         }
//       }

//       // 6. 清理测试数据
//       await Api.taskApi.deleteTask(taskId, true);
//       final remainingTasks = await Api.taskApi.getTasks([Status.done]);
//       expect(remainingTasks.any((t) => t.id == taskId), isFalse);
//     });
//   });
// }
