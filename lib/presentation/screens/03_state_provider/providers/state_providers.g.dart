// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$darkModeHash() => r'54d687970391283e693e0beb87bef8e54d34d8da';

/// See also [DarkMode].
@ProviderFor(DarkMode)
final darkModeProvider = AutoDisposeNotifierProvider<DarkMode, bool>.internal(
  DarkMode.new,
  name: r'darkModeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$darkModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DarkMode = AutoDisposeNotifier<bool>;
String _$counterHash() => r'205d6992bdee495da774d5c8476b1ea1c99732f8';

/// See also [Counter].
@ProviderFor(Counter)
final counterProvider = NotifierProvider<Counter, int>.internal(
  Counter.new,
  name: r'counterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$counterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Counter = Notifier<int>;
String _$userNameHash() => r'0e063b75d654f3a29c6b037fceb24168102fd47e';

/// See also [UserName].
@ProviderFor(UserName)
final userNameProvider = NotifierProvider<UserName, String>.internal(
  UserName.new,
  name: r'userNameProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userNameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserName = Notifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
