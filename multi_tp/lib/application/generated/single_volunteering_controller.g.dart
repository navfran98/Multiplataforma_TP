// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../controllers/single_volunteering_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$singleVolunteeringControllerHash() =>
    r'04df1ac1317b61af994cb74bc54652ca60190424';

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

abstract class _$SingleVolunteeringController
    extends BuildlessAutoDisposeAsyncNotifier<Volunteering?> {
  late final dynamic id;

  Future<Volunteering?> build(
    dynamic id,
  );
}

/// See also [SingleVolunteeringController].
@ProviderFor(SingleVolunteeringController)
const singleVolunteeringControllerProvider =
    SingleVolunteeringControllerFamily();

/// See also [SingleVolunteeringController].
class SingleVolunteeringControllerFamily
    extends Family<AsyncValue<Volunteering?>> {
  /// See also [SingleVolunteeringController].
  const SingleVolunteeringControllerFamily();

  /// See also [SingleVolunteeringController].
  SingleVolunteeringControllerProvider call(
    dynamic id,
  ) {
    return SingleVolunteeringControllerProvider(
      id,
    );
  }

  @override
  SingleVolunteeringControllerProvider getProviderOverride(
    covariant SingleVolunteeringControllerProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'singleVolunteeringControllerProvider';
}

/// See also [SingleVolunteeringController].
class SingleVolunteeringControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SingleVolunteeringController,
        Volunteering?> {
  /// See also [SingleVolunteeringController].
  SingleVolunteeringControllerProvider(
    dynamic id,
  ) : this._internal(
          () => SingleVolunteeringController()..id = id,
          from: singleVolunteeringControllerProvider,
          name: r'singleVolunteeringControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$singleVolunteeringControllerHash,
          dependencies: SingleVolunteeringControllerFamily._dependencies,
          allTransitiveDependencies:
              SingleVolunteeringControllerFamily._allTransitiveDependencies,
          id: id,
        );

  SingleVolunteeringControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final dynamic id;

  @override
  Future<Volunteering?> runNotifierBuild(
    covariant SingleVolunteeringController notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(SingleVolunteeringController Function() create) {
    return ProviderOverride(
      origin: this,
      override: SingleVolunteeringControllerProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SingleVolunteeringController,
      Volunteering?> createElement() {
    return _SingleVolunteeringControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SingleVolunteeringControllerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SingleVolunteeringControllerRef
    on AutoDisposeAsyncNotifierProviderRef<Volunteering?> {
  /// The parameter `id` of this provider.
  dynamic get id;
}

class _SingleVolunteeringControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        SingleVolunteeringController,
        Volunteering?> with SingleVolunteeringControllerRef {
  _SingleVolunteeringControllerProviderElement(super.provider);

  @override
  dynamic get id => (origin as SingleVolunteeringControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
