import 'package:neversitup/shared/data/remote/network_service.dart';
import 'package:neversitup/shared/domain/models/departments/department_model.dart';
import 'package:neversitup/shared/domain/models/either.dart';
import 'package:neversitup/shared/domain/models/products/product_by_department_id_model.dart';
import 'package:neversitup/shared/exceptions/http_exception.dart';

abstract class DashboardDatasource {
  Future<Either<AppException, List<DepartmentModel>>> fetchDepartments();
  Future<Either<AppException, List<ProductByDepartmentIdModel>>>
      fetchProductByDepartmentId(String departmentId);
}

class DashboardRemoteDatasource extends DashboardDatasource {
  final NetworkService networkService;
  DashboardRemoteDatasource(this.networkService);

  @override
  Future<Either<AppException, List<DepartmentModel>>> fetchDepartments() async {
    final response = await networkService.get('/api/v1/departments');
    return response.fold(
      (l) => Left(l),
      (r) {
        final jsonData = r.data;
        if (jsonData == null) {
          return Left(
            AppException(
              identifier: 'fetchDepartments',
              statusCode: 0,
              message: 'data not found !!',
            ),
          );
        }

        List<DepartmentModel> departments = [];
        for (var json in jsonData) {
          departments.add(DepartmentModel.fromJson(json));
        }

        return Right(departments);
      },
    );
  }

  @override
  Future<Either<AppException, List<ProductByDepartmentIdModel>>>
      fetchProductByDepartmentId(String departmentId) async {
    final response =
        await networkService.get('/api/v1/departments/$departmentId/products');
    return response.fold(
      (l) => Left(l),
      (r) {
        final jsonData = r.data;
        if (jsonData == null) {
          return Left(
            AppException(
              identifier: 'fetchProductByDepartmentId',
              statusCode: 0,
              message: 'data not found !!',
            ),
          );
        }

        List<ProductByDepartmentIdModel> departments = [];
        for (var json in jsonData) {
          departments.add(ProductByDepartmentIdModel.fromJson(json));
        }

        return Right(departments);
      },
    );
  }
}
