import 'package:neversitup/shared/domain/models/departments/department_model.dart';
import 'package:neversitup/shared/domain/models/either.dart';
import 'package:neversitup/shared/domain/models/products/product_by_department_id_model.dart';
import 'package:neversitup/shared/exceptions/http_exception.dart';

abstract class DashboardRepository {
  Future<Either<AppException, List<DepartmentModel>>> fetchDepartments();
  Future<Either<AppException, List<ProductByDepartmentIdModel>>>
      fetchProductByDepartmentId(String departmentId);
}
