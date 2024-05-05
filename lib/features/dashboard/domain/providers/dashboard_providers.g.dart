// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dashboardDatasourceHash() =>
    r'acbce63880be3959a52460867ac52dfef35f44fd';

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

/// See also [dashboardDatasource].
@ProviderFor(dashboardDatasource)
const dashboardDatasourceProvider = DashboardDatasourceFamily();

/// See also [dashboardDatasource].
class DashboardDatasourceFamily extends Family<DashboardDatasource> {
  /// See also [dashboardDatasource].
  const DashboardDatasourceFamily();

  /// See also [dashboardDatasource].
  DashboardDatasourceProvider call(
    NetworkService networkService,
  ) {
    return DashboardDatasourceProvider(
      networkService,
    );
  }

  @override
  DashboardDatasourceProvider getProviderOverride(
    covariant DashboardDatasourceProvider provider,
  ) {
    return call(
      provider.networkService,
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
  String? get name => r'dashboardDatasourceProvider';
}

/// See also [dashboardDatasource].
class DashboardDatasourceProvider
    extends AutoDisposeProvider<DashboardDatasource> {
  /// See also [dashboardDatasource].
  DashboardDatasourceProvider(
    NetworkService networkService,
  ) : this._internal(
          (ref) => dashboardDatasource(
            ref as DashboardDatasourceRef,
            networkService,
          ),
          from: dashboardDatasourceProvider,
          name: r'dashboardDatasourceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dashboardDatasourceHash,
          dependencies: DashboardDatasourceFamily._dependencies,
          allTransitiveDependencies:
              DashboardDatasourceFamily._allTransitiveDependencies,
          networkService: networkService,
        );

  DashboardDatasourceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.networkService,
  }) : super.internal();

  final NetworkService networkService;

  @override
  Override overrideWith(
    DashboardDatasource Function(DashboardDatasourceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DashboardDatasourceProvider._internal(
        (ref) => create(ref as DashboardDatasourceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        networkService: networkService,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<DashboardDatasource> createElement() {
    return _DashboardDatasourceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DashboardDatasourceProvider &&
        other.networkService == networkService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, networkService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DashboardDatasourceRef on AutoDisposeProviderRef<DashboardDatasource> {
  /// The parameter `networkService` of this provider.
  NetworkService get networkService;
}

class _DashboardDatasourceProviderElement
    extends AutoDisposeProviderElement<DashboardDatasource>
    with DashboardDatasourceRef {
  _DashboardDatasourceProviderElement(super.provider);

  @override
  NetworkService get networkService =>
      (origin as DashboardDatasourceProvider).networkService;
}

String _$dashboardRepositoryHash() =>
    r'b9f8ee1d8caec12a4833c60f3c62d82991b12428';

/// See also [dashboardRepository].
@ProviderFor(dashboardRepository)
final dashboardRepositoryProvider =
    AutoDisposeProvider<DashboardRepository>.internal(
  dashboardRepository,
  name: r'dashboardRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dashboardRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DashboardRepositoryRef = AutoDisposeProviderRef<DashboardRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
