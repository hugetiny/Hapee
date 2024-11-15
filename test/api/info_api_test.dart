// // Package imports:
// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// // Project imports:
// import 'package:hapee/gopeed_api/endpoints/info_api.dart';
// import 'package:hapee/gopeed_api/exceptions.dart';
// import '../mocks.mocks.dart';

// void main() {
//   group('InfoApi', () {
//     late MockDio mockDio;
//     late InfoApi infoApi;

//     setUp(() {
//       mockDio = MockDio();
//       infoApi = InfoApi()..dio = mockDio;
//     });

//     test('getInfo should return server info', () async {
//       final mockResponse = {
//         'code': 0,
//         'msg': '',
//         'data': {
//           'version': '1.0.0',
//           'runtime': 'go1.20',
//           'os': 'linux',
//           'arch': 'amd64',
//           'inDocker': false
//         }
//       };

//       when(mockDio.get(any)).thenAnswer(
//         (_) async => Response(
//           data: mockResponse,
//           statusCode: 200,
//           requestOptions: RequestOptions(path: ''),
//         ),
//       );

//       final info = await infoApi.getInfo();

//       expect(info.version, equals('1.0.0'));
//       expect(info.runtime, equals('go1.20'));
//       expect(info.os, equals('linux'));
//       expect(info.arch, equals('amd64'));
//       expect(info.inDocker, equals(false));

//       verify(mockDio.get('/api/v1/info')).called(1);
//     });

//     test('getInfo should handle error response', () async {
//       final errorResponse = {
//         'code': 1001,
//         'msg': 'Server error',
//         'data': null,
//       };

//       when(mockDio.get(any)).thenThrow(
//         DioException(
//           requestOptions: RequestOptions(path: ''),
//           response: Response(
//             requestOptions: RequestOptions(path: ''),
//             data: errorResponse,
//             statusCode: 500,
//           ),
//           error: ApiResponseException(
//             errorResponse['code'] as int,
//             errorResponse['msg'] as String,
//           ),
//         ),
//       );

//       expect(
//         () => infoApi.getInfo(),
//         throwsA(
//           isA<DioException>().having(
//             (e) => (e.error as ApiResponseException),
//             'error',
//             isA<ApiResponseException>()
//                 .having((e) => e.code, 'code', equals(1001))
//                 .having((e) => e.message, 'message', equals('Server error')),
//           ),
//         ),
//       );
//     });

//     test('getInfo should handle timeout', () async {
//       when(mockDio.get(any)).thenThrow(
//         DioException(
//           requestOptions: RequestOptions(path: ''),
//           type: DioExceptionType.connectionTimeout,
//           error: const TimeoutException(),
//         ),
//       );

//       expect(
//         () => infoApi.getInfo(),
//         throwsA(
//           isA<DioException>().having(
//             (e) => e.error,
//             'error',
//             isA<TimeoutException>(),
//           ),
//         ),
//       );
//     });
//   });
// }
