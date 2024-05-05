// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchDepartmentsHash() => r'70bcf16524484ff5f512d955b42f18aa1a00774d';

/// See also [fetchDepartments].
@ProviderFor(fetchDepartments)
final fetchDepartmentsProvider =
    AutoDisposeFutureProvider<List<DepartmentModel>>.internal(
  fetchDepartments,
  name: r'fetchDepartmentsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchDepartmentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchDepartmentsRef
    = AutoDisposeFutureProviderRef<List<DepartmentModel>>;
String _$fetchProductByDepartmentIdHash() =>
    r'179f204cf91ad6e9d210260ead03c0a898965cd5';

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

/// See also [fetchProductByDepartmentId].
@ProviderFor(fetchProductByDepartmentId)
const fetchProductByDepartmentIdProvider = FetchProductByDepartmentIdFamily();

/// See also [fetchProductByDepartmentId].
class FetchProductByDepartmentIdFamily
    extends Family<AsyncValue<List<ProductByDepartmentIdModel>>> {
  /// See also [fetchProductByDepartmentId].
  const FetchProductByDepartmentIdFamily();

  /// See also [fetchProductByDepartmentId].
  FetchProductByDepartmentIdProvider call(
    String departmentId,
  ) {
    return FetchProductByDepartmentIdProvider(
      departmentId,
    );
  }

  @override
  FetchProductByDepartmentIdProvider getProviderOverride(
    covariant FetchProductByDepartmentIdProvider provider,
  ) {
    return call(
      provider.departmentId,
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
  String? get name => r'fetchProductByDepartmentIdProvider';
}

/// See also [fetchProductByDepartmentId].
class FetchProductByDepartmentIdProvider
    extends AutoDisposeFutureProvider<List<ProductByDepartmentIdModel>> {
  /// See also [fetchProductByDepartmentId].
  FetchProductByDepartmentIdProvider(
    String departmentId,
  ) : this._internal(
          (ref) => fetchProductByDepartmentId(
            ref as FetchProductByDepartmentIdRef,
            departmentId,
          ),
          from: fetchProductByDepartmentIdProvider,
          name: r'fetchProductByDepartmentIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchProductByDepartmentIdHash,
          dependencies: FetchProductByDepartmentIdFamily._dependencies,
          allTransitiveDependencies:
              FetchProductByDepartmentIdFamily._allTransitiveDependencies,
          departmentId: departmentId,
        );

  FetchProductByDepartmentIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.departmentId,
  }) : super.internal();

  final String departmentId;

  @override
  Override overrideWith(
    FutureOr<List<ProductByDepartmentIdModel>> Function(
            FetchProductByDepartmentIdRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchProductByDepartmentIdProvider._internal(
        (ref) => create(ref as FetchProductByDepartmentIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        departmentId: departmentId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ProductByDepartmentIdModel>>
      createElement() {
    return _FetchProductByDepartmentIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchProductByDepartmentIdProvider &&
        other.departmentId == departmentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, departmentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchProductByDepartmentIdRef
    on AutoDisposeFutureProviderRef<List<ProductByDepartmentIdModel>> {
  /// The parameter `departmentId` of this provider.
  String get departmentId;
}

class _FetchProductByDepartmentIdProviderElement
    extends AutoDisposeFutureProviderElement<List<ProductByDepartmentIdModel>>
    with FetchProductByDepartmentIdRef {
  _FetchProductByDepartmentIdProviderElement(super.provider);

  @override
  String get departmentId =>
      (origin as FetchProductByDepartmentIdProvider).departmentId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
