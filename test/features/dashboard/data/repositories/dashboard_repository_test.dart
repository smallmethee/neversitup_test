import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neversitup/features/dashboard/data/datasource/dashboard_remote_datasource.dart';
import 'package:neversitup/features/dashboard/data/repositories/dashboard_repository.dart';
import 'package:neversitup/shared/domain/models/departments/department_model.dart';
import 'package:neversitup/shared/domain/models/either.dart';
import 'package:neversitup/shared/domain/models/products/product_by_department_id_model.dart';
import 'package:neversitup/shared/exceptions/http_exception.dart';

class MockDashboardDatasource extends Mock implements DashboardDatasource {}

void main() {
  late MockDashboardDatasource mockDashboardDatasource;
  late DashboardRepositoryImpl repository;

  setUp(() {
    mockDashboardDatasource = MockDashboardDatasource();
    repository = DashboardRepositoryImpl(mockDashboardDatasource);
  });

  group('fetchDepartments', () {
    final tDepartments = [
      const DepartmentModel(
          name: "Movies", imageUrl: "https://loremflickr.com/640/480", id: "1"),
      const DepartmentModel(
          name: "Movies", imageUrl: "https://loremflickr.com/640/480", id: "2")
    ];

    test(
        'should return a list of departments when the call to datasource is successful',
        () async {
      // Arrange
      when(() => mockDashboardDatasource.fetchDepartments())
          .thenAnswer((_) async => Right(tDepartments));

      final result = await repository.fetchDepartments();

      expect(result, isA<Right<AppException, List<DepartmentModel>>>());
      result.fold(
        (error) => fail('Expected success but got error: $error'),
        (list) => expect(list, equals(tDepartments)),
      );
    });

    test('should return an error when the call to datasource fails', () async {
      // Arrange
      when(() => mockDashboardDatasource.fetchDepartments())
          .thenAnswer((_) async => Left(AppException(
                identifier: 'fetchDepartments',
                statusCode: 0,
                message: 'data not found !!',
              )));

      final result = await repository.fetchDepartments();

      expect(result, isA<Left<AppException, List<DepartmentModel>>>());
      verify(() => mockDashboardDatasource.fetchDepartments()).called(1);
    });
  });

  group('fetchProductByDepartmentId', () {
    final tProducts = [
      const ProductByDepartmentIdModel(
          name: "Recycled Plastic Tuna",
          imageUrl: "https://loremflickr.com/640/480",
          desc:
              "'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles",
          price: "398.00",
          type: "normal",
          id: "1",
          departmentId: "1"),
      const ProductByDepartmentIdModel(
          name: "Recycled Plastic Tuna",
          imageUrl: "https://loremflickr.com/640/480",
          desc:
              "'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles",
          price: "398.00",
          type: "normal",
          id: "1",
          departmentId: "1")
    ];
    const tDepartmentId = '1';

    test(
        'should return a list of products when the call to datasource is successful',
        () async {
      when(() => mockDashboardDatasource.fetchProductByDepartmentId(any()))
          .thenAnswer((_) async => Right(tProducts));

      final result = await repository.fetchProductByDepartmentId(tDepartmentId);

      expect(
          result, isA<Right<AppException, List<ProductByDepartmentIdModel>>>());
      result.fold(
        (error) => fail('Expected success but got error: $error'),
        (list) => expect(list, equals(tProducts)),
      );
      verify(() =>
              mockDashboardDatasource.fetchProductByDepartmentId(tDepartmentId))
          .called(1);
    });

    test('should return an error when the call to datasource fails', () async {
      when(() => mockDashboardDatasource.fetchProductByDepartmentId(any()))
          .thenAnswer((_) async => Left(AppException(
                identifier: 'fetchDepartments',
                statusCode: 0,
                message: 'data not found !!',
              )));

      final result = await repository.fetchProductByDepartmentId(tDepartmentId);

      expect(
          result, isA<Left<AppException, List<ProductByDepartmentIdModel>>>());
      verify(() =>
              mockDashboardDatasource.fetchProductByDepartmentId(tDepartmentId))
          .called(1);
    });
  });
}
