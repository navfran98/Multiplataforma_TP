// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../controllers/single_news_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$singleNewsControllerHash() =>
    r'4c55b515a19303660724c82ded439a7b4cb12b2e';

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

abstract class _$SingleNewsController
    extends BuildlessAutoDisposeAsyncNotifier<News?> {
  late final dynamic id;

  FutureOr<News?> build(
    dynamic id,
  );
}

/// See also [SingleNewsController].
@ProviderFor(SingleNewsController)
const singleNewsControllerProvider = SingleNewsControllerFamily();

/// See also [SingleNewsController].
class SingleNewsControllerFamily extends Family<AsyncValue<News?>> {
  /// See also [SingleNewsController].
  const SingleNewsControllerFamily();

  /// See also [SingleNewsController].
  SingleNewsControllerProvider call(
    dynamic id,
  ) {
    return SingleNewsControllerProvider(
      id,
    );
  }

  @override
  SingleNewsControllerProvider getProviderOverride(
    covariant SingleNewsControllerProvider provider,
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
  String? get name => r'singleNewsControllerProvider';
}

/// See also [SingleNewsController].
class SingleNewsControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SingleNewsController, News?> {
  /// See also [SingleNewsController].
  SingleNewsControllerProvider(
    dynamic id,
  ) : this._internal(
          () => SingleNewsController()..id = id,
          from: singleNewsControllerProvider,
          name: r'singleNewsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$singleNewsControllerHash,
          dependencies: SingleNewsControllerFamily._dependencies,
          allTransitiveDependencies:
              SingleNewsControllerFamily._allTransitiveDependencies,
          id: id,
        );

  SingleNewsControllerProvider._internal(
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
  FutureOr<News?> runNotifierBuild(
    covariant SingleNewsController notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(SingleNewsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: SingleNewsControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<SingleNewsController, News?>
      createElement() {
    return _SingleNewsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SingleNewsControllerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SingleNewsControllerRef on AutoDisposeAsyncNotifierProviderRef<News?> {
  /// The parameter `id` of this provider.
  dynamic get id;
}

class _SingleNewsControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SingleNewsController, News?>
    with SingleNewsControllerRef {
  _SingleNewsControllerProviderElement(super.provider);

  @override
  dynamic get id => (origin as SingleNewsControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
