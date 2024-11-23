// Dart imports:
import 'dart:ffi';
import 'dart:io';
import 'dart:isolate';

// Project imports:
import 'package:hapee/app/core/utils/util.dart';
import '../common/libgopeed_channel.dart';
import '../common/libgopeed_ffi.dart';
import '../common/libgopeed_interface.dart';
import '../common/start_config.dart';
import '../ffi/libgopeed_bind.dart';
import '../libgopeed_boot.dart';

LibgopeedBoot create() => LibgopeedBootNative();

class LibgopeedBootNative implements LibgopeedBoot {
  late LibgopeedInterface _libgopeed;

  LibgopeedBootNative() {
    if (!Util.isDesktop) _libgopeed = LibgopeedChannel();
  }

  @override
  Future<int> start(StartConfig cfg) async {
    return Util.isDesktop
        ? await Isolate.run(() {
            _libgopeed = LibgopeedFFi(LibgopeedBind(DynamicLibrary.open(
                'libgopeed.${Platform.isWindows ? 'dll' : Platform.isMacOS ? 'dylib' : 'so'}')));
            return _libgopeed.start(cfg);
          })
        : await _libgopeed.start(cfg);
  }

  @override
  Future<void> stop() => _libgopeed.stop();
}
