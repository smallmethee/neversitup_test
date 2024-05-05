import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_by_department_id_model.freezed.dart';
part 'product_by_department_id_model.g.dart';

@freezed
class ProductByDepartmentIdModel with _$ProductByDepartmentIdModel {
  const factory ProductByDepartmentIdModel({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "imageUrl") String? imageUrl,
    @JsonKey(name: "desc") String? desc,
    @JsonKey(name: "price") String? price,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "departmentId") String? departmentId,
  }) = _ProductByDepartmentIdModel;

  factory ProductByDepartmentIdModel.fromJson(Map<String, dynamic> json) =>
      _$ProductByDepartmentIdModelFromJson(json);
}
