import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neversitup/features/dashboard/domain/providers/dashboard_providers.dart';
import 'package:neversitup/shared/domain/models/departments/department_model.dart';
import 'package:neversitup/shared/domain/models/products/product_by_department_id_model.dart';
import 'package:neversitup/shared/extension/cache.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_state_provider.g.dart';

@riverpod
Future<List<DepartmentModel>> fetchDepartments(FetchDepartmentsRef ref) async {
  final repository = ref.watch(dashboardRepositoryProvider);
  final response = await repository.fetchDepartments();
  return response.fold(
    (exception) => throw exception,
    (data) => data,
  );
}

@riverpod
Future<List<ProductByDepartmentIdModel>> fetchProductByDepartmentId(
    FetchProductByDepartmentIdRef ref, String departmentId) async {
  final repository = ref.watch(dashboardRepositoryProvider);
  ref.cacheFor(const Duration(minutes: 1));
  final response = await repository.fetchProductByDepartmentId(departmentId);
  return response.fold(
    (exception) => throw exception,
    (data) => data,
  );
}

final selectedDepartmentProvider =
    StateProvider<DepartmentModel?>((ref) => null);
