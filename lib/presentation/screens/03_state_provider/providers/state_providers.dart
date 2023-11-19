import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state_providers.g.dart';

@riverpod
class DarkMode extends _$DarkMode {
  @override
  bool build() => false;

  void toggleDarkMode() {
    state = !state;
  }
}

@Riverpod(keepAlive: true)
class Counter extends _$Counter {
  @override
  int build() => 0;

  void increaseByOne() {
    state++;
  }
}
//DarkMode

@Riverpod(keepAlive: true)
class UserName extends _$UserName {
  @override
  String build() => 'melissa Flores';

  void changeName(String name) {
    state = name;
  }
}
