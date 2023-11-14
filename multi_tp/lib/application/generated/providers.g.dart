// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../providers.dart';

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
String _$newsDaoHash() => r'76ac7cbc2543bdc4934db538341abff36c5a9047';

/// See also [newsDao].
@ProviderFor(newsDao)
final newsDaoProvider = Provider<NewsDao>.internal(
  newsDao,
  name: r'newsDaoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$newsDaoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NewsDaoRef = ProviderRef<NewsDao>;
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
String _$newsRepositoryHash() => r'12050bf0bbc0355f32621322312770b19b9ae77d';

/// See also [newsRepository].
@ProviderFor(newsRepository)
final newsRepositoryProvider = Provider<NewsRepository>.internal(
  newsRepository,
  name: r'newsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$newsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NewsRepositoryRef = ProviderRef<NewsRepository>;
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
