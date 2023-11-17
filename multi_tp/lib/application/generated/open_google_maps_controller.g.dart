// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../controllers/open_google_maps_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$openGoogleMapsControllerHash() =>
    r'7ed9332b3b6a393b2addb1ac00b0718d59e85bd0';

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

/// See also [openGoogleMapsController].
@ProviderFor(openGoogleMapsController)
const openGoogleMapsControllerProvider = OpenGoogleMapsControllerFamily();

/// See also [openGoogleMapsController].
class OpenGoogleMapsControllerFamily extends Family<void> {
  /// See also [openGoogleMapsController].
  const OpenGoogleMapsControllerFamily();

  /// See also [openGoogleMapsController].
  OpenGoogleMapsControllerProvider call({
    required GeoPoint location,
  }) {
    return OpenGoogleMapsControllerProvider(
      location: location,
    );
  }

  @override
  OpenGoogleMapsControllerProvider getProviderOverride(
    covariant OpenGoogleMapsControllerProvider provider,
  ) {
    return call(
      location: provider.location,
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
  String? get name => r'openGoogleMapsControllerProvider';
}

/// See also [openGoogleMapsController].
class OpenGoogleMapsControllerProvider extends AutoDisposeProvider<void> {
  /// See also [openGoogleMapsController].
  OpenGoogleMapsControllerProvider({
    required GeoPoint location,
  }) : this._internal(
          (ref) => openGoogleMapsController(
            ref as OpenGoogleMapsControllerRef,
            location: location,
          ),
          from: openGoogleMapsControllerProvider,
          name: r'openGoogleMapsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$openGoogleMapsControllerHash,
          dependencies: OpenGoogleMapsControllerFamily._dependencies,
          allTransitiveDependencies:
              OpenGoogleMapsControllerFamily._allTransitiveDependencies,
          location: location,
        );

  OpenGoogleMapsControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.location,
  }) : super.internal();

  final GeoPoint location;

  @override
  Override overrideWith(
    void Function(OpenGoogleMapsControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OpenGoogleMapsControllerProvider._internal(
        (ref) => create(ref as OpenGoogleMapsControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        location: location,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<void> createElement() {
    return _OpenGoogleMapsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OpenGoogleMapsControllerProvider &&
        other.location == location;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, location.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OpenGoogleMapsControllerRef on AutoDisposeProviderRef<void> {
  /// The parameter `location` of this provider.
  GeoPoint get location;
}

class _OpenGoogleMapsControllerProviderElement
    extends AutoDisposeProviderElement<void> with OpenGoogleMapsControllerRef {
  _OpenGoogleMapsControllerProviderElement(super.provider);

  @override
  GeoPoint get location =>
      (origin as OpenGoogleMapsControllerProvider).location;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
