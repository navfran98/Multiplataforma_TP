// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_volunteerings_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchVolunteeringsControllerHash() =>
    r'84e4eea48c25044a6ade618cdb6fb09b5a871086';

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

abstract class _$SearchVolunteeringsController
    extends BuildlessAutoDisposeNotifier<List<Volunteering>> {
  late final List<Volunteering> volunteerings;

  List<Volunteering> build({
    required List<Volunteering> volunteerings,
  });
}

/// See also [SearchVolunteeringsController].
@ProviderFor(SearchVolunteeringsController)
const searchVolunteeringsControllerProvider =
    SearchVolunteeringsControllerFamily();

/// See also [SearchVolunteeringsController].
class SearchVolunteeringsControllerFamily extends Family<List<Volunteering>> {
  /// See also [SearchVolunteeringsController].
  const SearchVolunteeringsControllerFamily();

  /// See also [SearchVolunteeringsController].
  SearchVolunteeringsControllerProvider call({
    required List<Volunteering> volunteerings,
  }) {
    return SearchVolunteeringsControllerProvider(
      volunteerings: volunteerings,
    );
  }

  @override
  SearchVolunteeringsControllerProvider getProviderOverride(
    covariant SearchVolunteeringsControllerProvider provider,
  ) {
    return call(
      volunteerings: provider.volunteerings,
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
  String? get name => r'searchVolunteeringsControllerProvider';
}

/// See also [SearchVolunteeringsController].
class SearchVolunteeringsControllerProvider
    extends AutoDisposeNotifierProviderImpl<SearchVolunteeringsController,
        List<Volunteering>> {
  /// See also [SearchVolunteeringsController].
  SearchVolunteeringsControllerProvider({
    required List<Volunteering> volunteerings,
  }) : this._internal(
          () => SearchVolunteeringsController()..volunteerings = volunteerings,
          from: searchVolunteeringsControllerProvider,
          name: r'searchVolunteeringsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchVolunteeringsControllerHash,
          dependencies: SearchVolunteeringsControllerFamily._dependencies,
          allTransitiveDependencies:
              SearchVolunteeringsControllerFamily._allTransitiveDependencies,
          volunteerings: volunteerings,
        );

  SearchVolunteeringsControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.volunteerings,
  }) : super.internal();

  final List<Volunteering> volunteerings;

  @override
  List<Volunteering> runNotifierBuild(
    covariant SearchVolunteeringsController notifier,
  ) {
    return notifier.build(
      volunteerings: volunteerings,
    );
  }

  @override
  Override overrideWith(SearchVolunteeringsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchVolunteeringsControllerProvider._internal(
        () => create()..volunteerings = volunteerings,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        volunteerings: volunteerings,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<SearchVolunteeringsController,
      List<Volunteering>> createElement() {
    return _SearchVolunteeringsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchVolunteeringsControllerProvider &&
        other.volunteerings == volunteerings;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, volunteerings.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchVolunteeringsControllerRef
    on AutoDisposeNotifierProviderRef<List<Volunteering>> {
  /// The parameter `volunteerings` of this provider.
  List<Volunteering> get volunteerings;
}

class _SearchVolunteeringsControllerProviderElement
    extends AutoDisposeNotifierProviderElement<SearchVolunteeringsController,
        List<Volunteering>> with SearchVolunteeringsControllerRef {
  _SearchVolunteeringsControllerProviderElement(super.provider);

  @override
  List<Volunteering> get volunteerings =>
      (origin as SearchVolunteeringsControllerProvider).volunteerings;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
