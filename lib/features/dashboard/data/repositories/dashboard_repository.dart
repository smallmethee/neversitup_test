import 'package:neversitup/shared/domain/models/departments/department_model.dart';

import 'package:neversitup/shared/domain/models/either.dart';
import 'package:neversitup/shared/domain/models/products/product_by_department_id_model.dart';

import 'package:neversitup/shared/exceptions/http_exception.dart';

import '../../domain/repositories/dashboard_repository.dart';
import '../datasource/dashboard_remote_datasource.dart';

class DashboardRepositoryImpl extends DashboardRepository {
  final DashboardDatasource dashboardDatasource;
  DashboardRepositoryImpl(this.dashboardDatasource);

  @override
  Future<Either<AppException, List<DepartmentModel>>> fetchDepartments() {
    return dashboardDatasource.fetchDepartments();
  }

  @override
  Future<Either<AppException, List<ProductByDepartmentIdModel>>>
      fetchProductByDepartmentId(String departmentId) {
    return dashboardDatasource.fetchProductByDepartmentId(departmentId);
  }
}
