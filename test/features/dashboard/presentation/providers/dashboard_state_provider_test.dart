import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neversitup/features/dashboard/domain/providers/dashboard_providers.dart';
import 'package:neversitup/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:neversitup/features/dashboard/presentation/providers/dashboard_state_provider.dart';
import 'package:neversitup/shared/domain/models/departments/department_model.dart';
import 'package:neversitup/shared/domain/models/either.dart';
import 'package:neversitup/shared/domain/models/products/product_by_department_id_model.dart';

import '../../../../mocks/department.dart';
import '../../../../mocks/product_by_department_id.dart';

class MockDashboardRepository extends Mock implements DashboardRepository {}

void main() {
  group('Dashboard State Providers', () {
    late ProviderContainer container;
    late MockDashboardRepository mockRepository;

    setUp(() {
      mockRepository = MockDashboardRepository();
      container = ProviderContainer(overrides: [
        dashboardRepositoryProvider.overrideWithValue(mockRepository),
      ]);
    });

    test('fetchDepartments should provide data when successful', () async {
      when(mockRepository.fetchDepartments)
          .thenAnswer((_) async => Right(departmentData));

      final departments = await container.read(fetchDepartmentsProvider.future);
      expect(departments, isA<List<DepartmentModel>>());
      expect(departments.first.name, equals('Movies'));
    });

    test('fetchProductByDepartmentId should provide data when successful',
        () async {
      when(() => mockRepository.fetchProductByDepartmentId(any()))
          .thenAnswer((_) async => Right(productByDepartmentIdData));

      final products =
          await container.read(fetchProductByDepartmentIdProvider('1').future);
      expect(products, isA<List<ProductByDepartmentIdModel>>());
      expect(products.first.name, equals('Recycled Plastic Tuna'));
    });

    tearDown(() {
      container.dispose();
    });
  });
}
