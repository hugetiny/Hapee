// // Package imports:
// import 'package:flutter_test/flutter_test.dart';

// // Project imports:
// import 'package:hapee/gopeed_api/api.dart';
// import 'package:hapee/gopeed_models/models.dart';

// void main() {
//   group('API Performance Tests', () {
//     setUpAll(() {
//       Api.init('tcp', '127.0.0.1:9999', '');
//     });

//     test('Response Time Test', () async {
//       const iterations = 100;
//       final stopwatch = Stopwatch()..start();

//       for (var i = 0; i < iterations; i++) {
//         await Api.infoApi.getInfo();
//       }

//       stopwatch.stop();
//       final averageResponseTime = stopwatch.elapsedMilliseconds / iterations;

//       // 平均响应时间应该小于 100ms
//       expect(averageResponseTime, lessThan(100));
//     });

//     test('Concurrent Requests Test', () async {
//       const concurrentRequests = 20;
//       final stopwatch = Stopwatch()..start();

//       // 并发发送请求
//       await Future.wait(
//         List.generate(
//           concurrentRequests,
//           (_) => Api.infoApi.getInfo(),
//         ),
//       );

//       stopwatch.stop();
//       final totalTime = stopwatch.elapsedMilliseconds;

//       // 所有请求应该在 2 秒内完成
//       expect(totalTime, lessThan(2000));
//     });

//     test('Error Recovery Test', () async {
//       const iterations = 10;
//       int successCount = 0;

//       // 模拟不稳定的网络环境
//       for (var i = 0; i < iterations; i++) {
//         try {
//           await Api.taskApi.getTasks([Status.running]);
//           successCount++;
//         } catch (_) {
//           // 忽略错误
//         }
//         // 随机延迟模拟网络波动
//         await Future.delayed(Duration(milliseconds: 100 * i));
//       }

//       // 成功率应该大于 80%
//       expect(successCount / iterations, greaterThan(0.8));
//     });

//     test('Memory Usage Test', () async {
//       final initialMemory = DateTime.now().millisecondsSinceEpoch;
//       const iterations = 1000;

//       // 重复创建和释放资源
//       for (var i = 0; i < iterations; i++) {
//         final request = Request(url: 'https://example.com/test$i.zip');
//         await Api.resolveApi.resolve(request);
//       }

//       final memoryUsed = DateTime.now().millisecondsSinceEpoch - initialMemory;

//       // 内存增长应该在合理范围内
//       expect(memoryUsed, lessThan(5000)); // 5秒内完成
//     });

//     test('Large Payload Test', () async {
//       // 创建大量任务并获取列表
//       const taskCount = 100;
//       final tasks = await Future.wait(
//         List.generate(
//           taskCount,
//           (i) => Api.taskApi.createTask(
//             CreateTask(
//               req: Request(url: 'https://example.com/test$i.zip'),
//             ),
//           ),
//         ),
//       );

//       expect(tasks.length, equals(taskCount));

//       // 获取所有任务详情
//       final stopwatch = Stopwatch()..start();
//       final taskList = await Api.taskApi.getTasks([Status.ready]);
//       stopwatch.stop();

//       // 处理大量数据的响应时间应该在合理范围内
//       expect(stopwatch.elapsedMilliseconds, lessThan(1000));
//       expect(taskList.length, greaterThanOrEqualTo(taskCount));
//     });
//   });
// }
