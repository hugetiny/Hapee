// // Package imports:
// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// // Project imports:
// import 'package:hapee/gopeed_api/endpoints/task_api.dart';
// import 'package:hapee/gopeed_models/models.dart';
// import '../mocks.mocks.dart';

// void main() {
//   group('TaskApi', () {
//     late MockDio mockDio;
//     late TaskApi taskApi;

//     setUp(() {
//       mockDio = MockDio();
//       taskApi = TaskApi()..dio = mockDio;
//     });

//     test('getTasks should return task list', () async {
//       final mockResponse = {
//         'code': 0,
//         'msg': '',
//         'data': [
//           {
//             'id': '1',
//             'protocol': 'http',
//             'name': 'test.zip',
//             'meta': {
//               'req': {'url': 'https://example.com/test.zip'},
//               'opts': {'name': 'test.zip', 'path': '/downloads'}
//             },
//             'status': 'running',
//             'uploading': false,
//             'progress': {
//               'used': 1000,
//               'speed': 100,
//               'downloaded': 500,
//               'uploadSpeed': 0,
//               'uploaded': 0
//             },
//             'size': 1000,
//             'createdAt': '2023-01-01T00:00:00Z',
//             'updatedAt': '2023-01-01T00:00:00Z'
//           }
//         ]
//       };

//       when(mockDio.get(any)).thenAnswer(
//         (_) async => Response(
//           data: mockResponse,
//           statusCode: 200,
//           requestOptions: RequestOptions(path: ''),
//         ),
//       );

//       final tasks = await taskApi.getTasks([Status.running]);

//       expect(tasks.length, equals(1));
//       expect(tasks[0].id, equals('1'));
//       expect(tasks[0].name, equals('test.zip'));
//       expect(tasks[0].status, equals(Status.running));
//       expect(tasks[0].progress.downloaded, equals(500));

//       verify(mockDio.get('/api/v1/tasks?status=running')).called(1);
//     });

//     test('createTask should return task id', () async {
//       const mockTaskId = 'new-task-id';
//       final mockResponse = {
//         'code': 0,
//         'msg': '',
//         'data': mockTaskId
//       };

//       when(mockDio.post(any, data: anyNamed('data'))).thenAnswer(
//         (_) async => Response(
//           data: mockResponse,
//           statusCode: 200,
//           requestOptions: RequestOptions(path: ''),
//         ),
//       );

//       final createTask = CreateTask(
//         req: Request(url: 'https://example.com/test.zip'),
//       );

//       final taskId = await taskApi.createTask(createTask);

//       expect(taskId, equals(mockTaskId));
//       verify(mockDio.post('/api/v1/tasks', data: createTask)).called(1);
//     });

//     test('pauseTask should call correct endpoint', () async {
//       const taskId = 'task-1';
//       final mockResponse = {'code': 0, 'msg': '', 'data': null};

//       when(mockDio.put(any)).thenAnswer(
//         (_) async => Response(
//           data: mockResponse,
//           statusCode: 200,
//           requestOptions: RequestOptions(path: ''),
//         ),
//       );

//       await taskApi.pauseTask(taskId);
//       verify(mockDio.put('/api/v1/tasks/$taskId/pause')).called(1);
//     });

//     test('continueTask should call correct endpoint', () async {
//       const taskId = 'task-1';
//       final mockResponse = {'code': 0, 'msg': '', 'data': null};

//       when(mockDio.put(any)).thenAnswer(
//         (_) async => Response(
//           data: mockResponse,
//           statusCode: 200,
//           requestOptions: RequestOptions(path: ''),
//         ),
//       );

//       await taskApi.continueTask(taskId);
//       verify(mockDio.put('/api/v1/tasks/$taskId/continue')).called(1);
//     });

//     test('deleteTask should call correct endpoint', () async {
//       const taskId = 'task-1';
//       final mockResponse = {'code': 0, 'msg': '', 'data': null};

//       when(mockDio.delete(any)).thenAnswer(
//         (_) async => Response(
//           data: mockResponse,
//           statusCode: 200,
//           requestOptions: RequestOptions(path: ''),
//         ),
//       );

//       await taskApi.deleteTask(taskId, true);
//       verify(mockDio.delete('/api/v1/tasks/$taskId?force=true')).called(1);
//     });
//   });
// }
