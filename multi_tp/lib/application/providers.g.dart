// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userDaoHash() => r'0f6912cde274f05b21fc3f0e23d4e54530453c7d';

///
/// Daos
///
///
/// Copied from [userDao].
@ProviderFor(userDao)
final userDaoProvider = Provider<UserDao>.internal(
  userDao,
  name: r'userDaoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userDaoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserDaoRef = ProviderRef<UserDao>;
String _$authRepositoryHash() => r'14cef0de648cf4472222968e1d97329e2eb8963d';

///
/// Repositories
///
///
/// Copied from [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider = Provider<AuthRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthRepositoryRef = ProviderRef<AuthRepository>;
String _$userRepositoryHash() => r'a56ca75c16060fe77622a678af95c2a57b772e29';

/// See also [userRepository].
@ProviderFor(userRepository)
final userRepositoryProvider = Provider<UserRepository>.internal(
  userRepository,
  name: r'userRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserRepositoryRef = ProviderRef<UserRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
