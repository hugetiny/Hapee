// import 'package:pocketbase/pocketbase.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import './baas.dart';
// import 'package:fpdart/fpdart.dart';

// class PocketBaseBaaS implements BaaS {
//   late final PocketBase _pb;

//   // 1. 构造函数方式
//   PocketBaseBaaS() {
//     _pb = PocketBase(
//       const String.fromEnvironment('POCKETBASE_URL'),
//     );
//   }

//   @override
//   Future<void> initialize() async {
//     // 可以在这里：
//     // 1. 验证连接
//     try {
//       await _pb.health.check();
//     } catch (e) {
//       throw Exception('PocketBase connection failed: $e');
//     }

//     // 2. 恢复会话
//     final authStore = _pb.authStore;
//     if (authStore.isValid) {
//       try {
//         await _pb.collection('users').authRefresh();
//       } catch (_) {
//         authStore.clear();
//       }
//     }

//     // 3. 初始化其他依赖
//     // await _initializeOtherServices();
//   }

//   // 认证相关方法
//   @override
//   Future<void> signUp({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       await _pb.collection('users').create(body: {
//         'email': email,
//         'password': password,
//         'passwordConfirm': password,
//       });
//     } catch (e) {
//       throw _handlePocketBaseError(e);
//     }
//   }

//   @override
//   Future<void> signIn({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       await _pb.collection('users').authWithPassword(
//         email,
//         password,
//       );
//     } catch (e) {
//       throw _handlePocketBaseError(e);
//     }
//   }

//   @override
//   Future<void> signOut() async {
//     _pb.authStore.clear();
//   }

//   // 数据操作方法
//   @override
//   Future<T?> getData<T>({
//     required String collection,
//     required String id,
//     required T Function(Map<String, dynamic> json) fromJson,
//   }) async {
//     try {
//       final record = await _pb.collection(collection).getOne(id);
//       return fromJson(record.toJson());
//     } catch (e) {
//       throw _handlePocketBaseError(e);
//     }
//   }

//   @override
//   Future<Either<String, List<T>>> getDataList<T>({
//     required String collection,
//     required T Function(Map<String, dynamic> json) fromJson,
//     String? filter,
//     int? page,
//     int? perPage,
//   }) async {
//     try {
//       final records = await _pb.collection(collection).getList(
//         filter: filter,
//         page: page ?? 1,
//         perPage: perPage ?? 20,
//       );
//       return right(records.items.map((e) => fromJson(e.toJson())).toList());
//     } catch (e) {
//       final errorMessage = e is ClientException
//           ? e.response['message'] ?? '未知错误'
//           : e.toString();
//       return left(errorMessage);
//     }
//   }

//   // 实时数据
//   @override
//   Stream<T> streamData<T>({
//     required String collection,
//     required String id,
//     required T Function(Map<String, dynamic> json) fromJson,
//   }) {
//     return _pb
//         .collection(collection)
//         .subscribe('*', (e) => e.record.id == id)
//         .map((e) => fromJson(e.record.toJson()));
//   }

//   // 错误处理
//   Exception _handlePocketBaseError(dynamic error) {
//     if (error is ClientException) {
//       switch (error.statusCode) {
//         case 400:
//           return Exception('Invalid request: ${error.response}');
//         case 401:
//           return Exception('Unauthorized');
//         case 403:
//           return Exception('Forbidden');
//         case 404:
//           return Exception('Not found');
//         default:
//           return Exception('PocketBase error: ${error.message}');
//       }
//     }
//     return Exception('Unknown error: $error');
//   }
// }

// // Provider
// final pocketBaseBaaSProvider = Provider<BaaS>((ref) {
//   return PocketBaseBaaS();
// });
