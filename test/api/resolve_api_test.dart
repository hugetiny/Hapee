// // Package imports:
// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// // Project imports:
// import 'package:hapee/gopeed_api/endpoints/resolve_api.dart';
// import 'package:hapee/gopeed_api/exceptions.dart';
// import 'package:hapee/app/core/models/gopeed_models/common/models.dart';
// import '../mocks.mocks.dart';

// void main() {
//   group('ResolveApi', () {
//     late MockDio mockDio;
//     late ResolveApi resolveApi;

//     setUp(() {
//       mockDio = MockDio();
//       resolveApi = ResolveApi()..dio = mockDio;
//     });

//     test('resolve should return resolve result', () async {
//       final mockResponse = {
//         'code': 0,
//         'msg': '',
//         'data': {
//           'id': 'resolve-1',
//           'res': {
//             'name': 'example.zip',
//             'size': 1024,
//             'range': true,
//             'files': [
//               {
//                 'name': 'example.zip',
//                 'path': '',
//                 'size': 1024,
//                 'req': {'url': 'https://example.com/example.zip'}
//               }
//             ],
//             'hash': ''
//           }
//         }
//       };

//       when(mockDio.post(any, data: anyNamed('data'))).thenAnswer(
//         (_) async => Response(
//           data: mockResponse,
//           statusCode: 200,
//           requestOptions: RequestOptions(path: ''),
//         ),
//       );

//       final request = Request(url: 'https://example.com/example.zip');
//       final result = await resolveApi.resolve(request);

//       expect(result.id, equals('resolve-1'));
//       expect(result.res.name, equals('example.zip'));
//       expect(result.res.size, equals(1024));
//       expect(result.res.range, equals(true));
//       expect(result.res.files.length, equals(1));
//       expect(result.res.files[0].name, equals('example.zip'));
//       expect(result.res.files[0].size, equals(1024));

//       verify(mockDio.post('/api/v1/resolve', data: request)).called(1);
//     });

//     test('resolve should handle request cancellation', () async {
//       final cancelToken = CancelToken();
//       cancelToken.cancel('Cancelled by user');

//       expect(
//         () => resolveApi.resolve(
//           Request(url: 'https://example.com/test.zip'),
//           cancelToken: cancelToken,
//         ),
//         throwsA(isA<DioException>().having(
//           (e) => e.type,
//           'type',
//           equals(DioExceptionType.cancel),
//         )),
//       );
//     });

//     test('resolve should handle invalid URL', () async {
//       when(mockDio.post(any, data: anyNamed('data'))).thenThrow(
//         DioException(
//           requestOptions: RequestOptions(path: ''),
//           response: Response(
//             requestOptions: RequestOptions(path: ''),
//             data: {
//               'code': 1001,
//               'msg': 'Invalid URL format',
//             },
//             statusCode: 400,
//           ),
//           error: ApiResponseException(1001, 'Invalid URL format'),
//         ),
//       );

//       expect(
//         () => resolveApi.resolve(Request(url: 'invalid-url')),
//         throwsA(isA<DioException>().having(
//           (e) => e.error,
//           'error',
//           isA<ApiResponseException>()
//               .having((e) => e.code, 'code', equals(1001))
//               .having(
//                   (e) => e.message, 'message', equals('Invalid URL format')),
//         )),
//       );
//     });
//   });
// }
