import 'dart:ffi';
import 'dart:io';

class Randomizer {
  const Randomizer._();

  static const Randomizer instance = Randomizer._();

  static final DynamicLibrary _dynamicLibrary = Platform.isAndroid
      ? DynamicLibrary.open('librand.so')
      : DynamicLibrary.process();

  static late final int Function()? _random;

  void ensureInitialized() {
    _random = _dynamicLibrary
        .lookup<NativeFunction<Int32 Function()>>('rust_random')
        .asFunction();
  }

  int random() {
    if (_random == null) return -1;

    return _random!();
  }
}
