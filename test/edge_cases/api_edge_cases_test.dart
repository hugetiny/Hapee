// // Package imports:
// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';

// // Project imports:
// import 'package:hapee/gopeed_api/api.dart';
// import 'package:hapee/gopeed_api/exceptions.dart';
// import 'package:hapee/gopeed_models/models.dart';

// void main() {
//   group('API Edge Cases Tests', () {
//     setUpAll(() {
//       Api.init('tcp', '127.0.0.1:9999', '');
//     });

//     group('Task API Edge Cases', () {
//       test('should handle empty task list', () async {
//         final tasks = await Api.taskApi.getTasks([Status.done]);
//         expect(tasks, isEmpty);
//       });

//       test('should handle non-existent task', () async {
//         expect(
//           () => Api.taskApi.pauseTask('non-existent-id'),
//           throwsA(isA<DioException>().having(
//             (e) => e.error,
//             'error',
//             isA<ApiResponseException>(),
//           )),
//         );
//       });

//       test('should handle invalid task status transition', () async {
//         final taskId = await Api.taskApi.createTask(CreateTask(
//           req: Request(url: 'https://example.com/test.zip'),
//         ));

//         // 尝试继续一个未暂停的任务
//         expect(
//           () => Api.taskApi.continueTask(taskId),
//           throwsA(isA<DioException>().having(
//             (e) => e.error,
//             'error',
//             isA<ApiResponseException>(),
//           )),
//         );
//       });
//     });

//     group('Config API Edge Cases', () {
//       test('should handle invalid config values', () async {
//         final config = await Api.configApi.getConfig();

//         // 尝试设置无效的最大任务数
//         expect(
//           () => Api.configApi.putConfig(config.copyWith(maxRunning: -1)),
//           throwsA(isA<DioException>().having(
//             (e) => e.error,
//             'error',
//             isA<ApiResponseException>(),
//           )),
//         );
//       });

//       test('should handle non-existent download directory', () async {
//         final config = await Api.configApi.getConfig();

//         expect(
//           () => Api.configApi.putConfig(config.copyWith(
//             downloadDir: '/non/existent/path',
//           )),
//           throwsA(isA<DioException>().having(
//             (e) => e.error,
//             'error',
//             isA<ApiResponseException>(),
//           )),
//         );
//       });
//     });

//     group('Resolve API Edge Cases', () {
//       test('should handle malformed URLs', () async {
//         expect(
//           () => Api.resolveApi.resolve(Request(url: 'invalid-url')),
//           throwsA(isA<DioException>().having(
//             (e) => e.error,
//             'error',
//             isA<ApiResponseException>(),
//           )),
//         );
//       });

//       test('should handle very long URLs', () async {
//         final longUrl = 'https://example.com/${'a' * 2048}';
//         expect(
//           () => Api.resolveApi.resolve(Request(url: longUrl)),
//           throwsA(isA<DioException>().having(
//             (e) => e.error,
//             'error',
//             isA<ApiResponseException>(),
//           )),
//         );
//       });

//       test('should handle special characters in URLs', () async {
//         final specialUrl = 'https://example.com/test file with spaces.zip';
//         final result = await Api.resolveApi.resolve(Request(url: specialUrl));
//         expect(result.id, isNotEmpty);
//       });
//     });

//     group('Network Edge Cases', () {
//       test('should handle slow network', () async {
//         // 模拟慢速网络
//         await Future.delayed(const Duration(seconds: 2));
//         final info = await Api.infoApi.getInfo();
//         expect(info.version, isNotEmpty);
//       });

//       test('should handle request cancellation', () async {
//         final cancelToken = CancelToken();
//         Future.delayed(const Duration(milliseconds: 100), () {
//           cancelToken.cancel('Cancelled by user');
//         });

//         expect(
//           () => Api.resolveApi.resolve(
//             Request(url: 'https://example.com/test.zip'),
//             cancelToken: cancelToken,
//           ),
//           throwsA(isA<DioException>()),
//         );
//       });
//     });
//   });
// }
