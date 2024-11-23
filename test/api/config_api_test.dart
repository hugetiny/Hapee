// // Package imports:
// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// // Project imports:
// import 'package:hapee/gopeed_api/endpoints/config_api.dart';
// import 'package:hapee/app/core/models/gopeed_models/common/models.dart';
// import '../mocks.mocks.dart';

// void main() {
//   group('ConfigApi', () {
//     late MockDio mockDio;
//     late ConfigApi configApi;

//     setUp(() {
//       mockDio = MockDio();
//       configApi = ConfigApi()..dio = mockDio;
//     });

//     test('getConfig should return downloader config', () async {
//       final mockResponse = {
//         'code': 0,
//         'msg': '',
//         'data': {
//           'downloadDir': '/downloads',
//           'maxRunning': 3,
//           'protocolConfig': {
//             'http': {
//               'userAgent': 'test-agent',
//               'connections': 16,
//               'useServerCtime': false
//             },
//             'bt': {'listenPort': 6881, 'trackers': []}
//           },
//           'extra': {
//             'themeMode': 'dark',
//             'locale': 'en',
//             'lastDeleteTaskKeep': false,
//             'bt': {
//               'trackerSubscribeUrls': [],
//               'subscribeTrackers': [],
//               'autoUpdateTrackers': true,
//               'customTrackers': []
//             }
//           },
//           'proxy': {
//             'enable': false,
//             'system': false,
//             'scheme': 'http',
//             'host': '',
//             'usr': '',
//             'pwd': ''
//           }
//         }
//       };

//       when(mockDio.get(any)).thenAnswer(
//         (_) async => Response(
//           data: mockResponse,
//           statusCode: 200,
//           requestOptions: RequestOptions(path: ''),
//         ),
//       );

//       final config = await configApi.getConfig();

//       expect(config.downloadDir, equals('/downloads'));
//       expect(config.maxRunning, equals(3));
//       expect(config.protocolConfig.http.connections, equals(16));
//       expect(config.extra.themeMode, equals('dark'));

//       verify(mockDio.get('/api/v1/config')).called(1);
//     });

//     test('putConfig should update config', () async {
//       final mockResponse = {'code': 0, 'msg': '', 'data': null};

//       when(mockDio.put(any, data: anyNamed('data'))).thenAnswer(
//         (_) async => Response(
//           data: mockResponse,
//           statusCode: 200,
//           requestOptions: RequestOptions(path: ''),
//         ),
//       );

//       final config = DownloaderConfig(
//         downloadDir: '/new-downloads',
//         maxRunning: 5,
//       );

//       await configApi.putConfig(config);

//       verify(mockDio.put('/api/v1/config', data: config)).called(1);
//     });
//   });
// }
