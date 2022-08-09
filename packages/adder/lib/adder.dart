import 'dart:ffi';
import 'dart:io';

class Adder {
  const Adder._();

  static const Adder instance = Adder._();

  static final DynamicLibrary _dynamicLibrary = Platform.isAndroid
      ? DynamicLibrary.open('libadder.so')
      : DynamicLibrary.process();

  static late final int Function(int x, int y)? _add;

  void ensureInitialized() {
    _add = _dynamicLibrary
        .lookup<NativeFunction<Int32 Function(Int32, Int32)>>('add')
        .asFunction();
  }

  int add(int x, int y) {
    if (_add == null) return -1;

    return _add!(x, y);
  }
}
