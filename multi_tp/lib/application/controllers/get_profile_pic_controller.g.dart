// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_pic_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getProfilePicControllerHash() =>
    r'248ff3e7b265907edb2ffa3d3d7ea41a3481cc12';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getProfilePicController].
@ProviderFor(getProfilePicController)
const getProfilePicControllerProvider = GetProfilePicControllerFamily();

/// See also [getProfilePicController].
class GetProfilePicControllerFamily extends Family<AsyncValue<File?>> {
  /// See also [getProfilePicController].
  const GetProfilePicControllerFamily();

  /// See also [getProfilePicController].
  GetProfilePicControllerProvider call({
    required User user,
  }) {
    return GetProfilePicControllerProvider(
      user: user,
    );
  }

  @override
  GetProfilePicControllerProvider getProviderOverride(
    covariant GetProfilePicControllerProvider provider,
  ) {
    return call(
      user: provider.user,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getProfilePicControllerProvider';
}

/// See also [getProfilePicController].
class GetProfilePicControllerProvider extends AutoDisposeFutureProvider<File?> {
  /// See also [getProfilePicController].
  GetProfilePicControllerProvider({
    required User user,
  }) : this._internal(
          (ref) => getProfilePicController(
            ref as GetProfilePicControllerRef,
            user: user,
          ),
          from: getProfilePicControllerProvider,
          name: r'getProfilePicControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getProfilePicControllerHash,
          dependencies: GetProfilePicControllerFamily._dependencies,
          allTransitiveDependencies:
              GetProfilePicControllerFamily._allTransitiveDependencies,
          user: user,
        );

  GetProfilePicControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.user,
  }) : super.internal();

  final User user;

  @override
  Override overrideWith(
    FutureOr<File?> Function(GetProfilePicControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetProfilePicControllerProvider._internal(
        (ref) => create(ref as GetProfilePicControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        user: user,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<File?> createElement() {
    return _GetProfilePicControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetProfilePicControllerProvider && other.user == user;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, user.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetProfilePicControllerRef on AutoDisposeFutureProviderRef<File?> {
  /// The parameter `user` of this provider.
  User get user;
}

class _GetProfilePicControllerProviderElement
    extends AutoDisposeFutureProviderElement<File?>
    with GetProfilePicControllerRef {
  _GetProfilePicControllerProviderElement(super.provider);

  @override
  User get user => (origin as GetProfilePicControllerProvider).user;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
