import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppStorage {
  // ignore: unused_field
  Box? _box;

  /// for initialling app local storage
  Future<void> initAppStorage() async {
    await Hive.initFlutter();
    // TODO: add your storage name here
    _box = await Hive.openBox('hello world');
  }

  // example of storing & getting value

  /// for storing uploaded string value
  // final String _helloWorld = 'helloWorld';

  // /// for getting string from box
  // String? getHelloWorld() {
  //   return _box?.get(_helloWorld) as String?;
  // }

  // /// for storing helloWorld to app
  // Future<void> putHelloWorld(String helloWorld) async {
  //   await _box?.put(_helloWorld, helloWorld);
  // }

  /// for clearing all data in box
  Future<void> clearAllData() async {
    await _box?.clear();
  }
}

final appStorageProvider = Provider<AppStorage>(
  (_) {
    throw UnimplementedError();
  },
);
