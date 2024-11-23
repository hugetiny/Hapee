// // Package imports:
// import 'package:dio/dio.dart';
// import 'package:dio/io.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// // Project imports:
// import 'package:hapee/gopeed_api/api.dart';
// import 'package:hapee/gopeed_api/exceptions.dart';
// import '../mocks.mocks.dart';

// void main() {
//   group('ApiClient', () {
//     late ApiClient apiClient;
//     late MockDio mockDio;

//     setUp(() {
//       apiClient = ApiClient.instance;
//       mockDio = MockDio();
//     });

//     test('initialize should configure dio correctly for TCP', () {
//       apiClient.initialize(
//         network: 'tcp',
//         address: '127.0.0.1:9999',
//         apiToken: 'test-token',
//       );

//       expect(apiClient.dio.options.baseUrl, equals('http://127.0.0.1:9999'));
//       expect(apiClient.dio.options.headers['X-Api-Token'], equals('test-token'));
//       expect(apiClient.dio.options.sendTimeout, equals(const Duration(seconds: 5)));
//       expect(apiClient.dio.options.connectTimeout, equals(const Duration(seconds: 5)));
//       expect(apiClient.dio.options.receiveTimeout, equals(const Duration(seconds: 60)));
//     });

//     test('initialize should configure dio correctly for Unix Socket', () {
//       apiClient.initialize(
//         network: 'unix',
//         address: '/tmp/hapee.sock',
//         apiToken: 'test-token',
//       );

//       expect(apiClient.dio.options.baseUrl, equals('http://127.0.0.1'));
//       expect(apiClient.dio.options.headers['X-Api-Token'], equals('test-token'));
//       expect(apiClient.dio.httpClientAdapter, isA<IOHttpClientAdapter>());
//     });

//     group('Error Handling', () {
//       setUp(() {
//         apiClient.initialize(
//           network: 'tcp',
//           address: '127.0.0.1:9999',
//           apiToken: '',
//         );
//       });

//       test('should handle connection timeout', () async {
//         when(mockDio.get('/test')).thenThrow(
//           DioException(
//             requestOptions: RequestOptions(path: '/test'),
//             type: DioExceptionType.connectionTimeout,
//           ),
//         );

//         expect(
//           () => mockDio.get('/test'),
//           throwsA(isA<TimeoutException>()),
//         );
//       });

//       test('should handle send timeout', () async {
//         when(mockDio.get('/test')).thenThrow(
//           DioException(
//             requestOptions: RequestOptions(path: '/test'),
//             type: DioExceptionType.sendTimeout,
//           ),
//         );

//         expect(
//           () => mockDio.get('/test'),
//           throwsA(isA<TimeoutException>()),
//         );
//       });

//       test('should handle receive timeout', () async {
//         when(mockDio.get('/test')).thenThrow(
//           DioException(
//             requestOptions: RequestOptions(path: '/test'),
//             type: DioExceptionType.receiveTimeout,
//           ),
//         );

//         expect(
//           () => mockDio.get('/test'),
//           throwsA(isA<TimeoutException>()),
//         );
//       });

//       test('should handle API error response', () async {
//         when(mockDio.get('/test')).thenThrow(
//           DioException(
//             requestOptions: RequestOptions(path: '/test'),
//             response: Response(
//               requestOptions: RequestOptions(path: '/test'),
//               data: {
//                 'code': 1001,
//                 'msg': 'Test error',
//               },
//             ),
//           ),
//         );

//         expect(
//           () => mockDio.get('/test'),
//           throwsA(
//             isA<ApiResponseException>()
//                 .having((e) => e.code, 'code', equals(1001))
//                 .having((e) => e.message, 'message', equals('Test error')),
//           ),
//         );
//       });

//       test('should handle network error', () async {
//         when(mockDio.get('/test')).thenThrow(
//           DioException(
//             requestOptions: RequestOptions(path: '/test'),
//             error: 'Network error',
//           ),
//         );

//         expect(
//           () => mockDio.get('/test'),
//           throwsA(
//             isA<NetworkException>()
//                 .having((e) => e.message, 'message', equals('Network error')),
//           ),
//         );
//       });
//     });

//     group('Authentication', () {
//       test('should add API token to headers when provided', () {
//         apiClient.initialize(
//           network: 'tcp',
//           address: '127.0.0.1:9999',
//           apiToken: 'test-token',
//         );

//         expect(
//           apiClient.dio.options.headers['X-Api-Token'],
//           equals('test-token'),
//         );
//       });

//       test('should not add API token to headers when empty', () {
//         apiClient.initialize(
//           network: 'tcp',
//           address: '127.0.0.1:9999',
//           apiToken: '',
//         );

//         expect(
//           apiClient.dio.options.headers.containsKey('X-Api-Token'),
//           isFalse,
//         );
//       });
//     });
//   });
// }
