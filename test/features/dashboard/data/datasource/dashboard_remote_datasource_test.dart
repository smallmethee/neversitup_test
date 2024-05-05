import 'package:flutter_test/flutter_test.dart';
import 'package:neversitup/features/dashboard/data/datasource/dashboard_remote_datasource.dart';
import 'package:neversitup/shared/data/remote/network_service.dart';
import 'package:neversitup/shared/domain/models/departments/department_model.dart';
import 'package:neversitup/shared/domain/models/either.dart';
import 'package:neversitup/shared/domain/models/products/product_by_department_id_model.dart';
import 'package:neversitup/shared/domain/models/response.dart';
import 'package:neversitup/shared/exceptions/http_exception.dart';
import 'package:mocktail/mocktail.dart';

class MockNetworkService extends Mock implements NetworkService {}

void main() {
  late NetworkService mockNetworkService;
  late DashboardRemoteDatasource datasource;

  setUp(() {
    mockNetworkService = MockNetworkService();
    datasource = DashboardRemoteDatasource(mockNetworkService);
  });

  group('fetchDepartments', () {
    test('should return a list of DepartmentModel on success', () async {
      final responseData = Response(
        data: [
          {
            "name": "Movies",
            "imageUrl": "https://loremflickr.com/640/480",
            "id": "1"
          },
          {
            "name": "Movies",
            "imageUrl": "https://loremflickr.com/640/480",
            "id": "2"
          }
        ],
        statusMessage: '',
        statusCode: 200,
      );
      when(() => mockNetworkService.get('/api/v1/departments'))
          .thenAnswer((_) async {
        return responseData.toRight;
      });

      final result = await datasource.fetchDepartments();

      expect(result.isRight(), true);
      result.fold(
        (l) => null,
        (r) => expect(r, isA<List<DepartmentModel>>()),
      );
    });

    test('should return an AppException on failure', () async {
      when(() => mockNetworkService.get('/api/v1/departments')).thenAnswer(
          (_) async => Left(AppException(
              identifier: 'NetworkError',
              message: 'Failed to fetch',
              statusCode: 500)));

      final result = await datasource.fetchDepartments();

      expect(result.isLeft(), true);
      result.fold(
        (l) => expect(l, isA<AppException>()),
        (r) => null,
      );
    });
  });

  group('fetchProductByDepartmentId', () {
    const departmentId = '1';

    test('should return a list of ProductByDepartmentIdModel on success',
        () async {
      final responseData = Response(
        data: {
          {
            "name": "Recycled Plastic Tuna",
            "imageUrl": "https://loremflickr.com/640/480",
            "desc":
                "'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles",
            "price": "398.00",
            "type": "normal",
            "id": "1",
            "departmentId": "1"
          },
          {
            "name": "Handcrafted Fresh Pizza",
            "imageUrl": "https://loremflickr.com/640/480",
            "desc":
                "'s most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles",
            "price": "398.00",
            "type": "normal",
            "id": "1",
            "departmentId": "1"
          },
        },
        statusCode: 200,
      );

      when(() => mockNetworkService
              .get('/api/v1/departments/$departmentId/products'))
          .thenAnswer((_) async => Right(responseData));

      final result = await datasource.fetchProductByDepartmentId(departmentId);

      expect(result.isRight(), true);
      result.fold(
        (l) => null,
        (r) => expect(r, isA<List<ProductByDepartmentIdModel>>()),
      );
    });

    test('should return an AppException on failure', () async {
      when(() => mockNetworkService
              .get('/api/v1/departments/$departmentId/products'))
          .thenAnswer((_) async => Left(AppException(
              identifier: 'NetworkError',
              message: 'Failed to fetch',
              statusCode: 500)));

      final result = await datasource.fetchProductByDepartmentId(departmentId);

      expect(result.isLeft(), true);
      result.fold(
        (l) => expect(l, isA<AppException>()),
        (r) => null,
      );
    });
  });
}
