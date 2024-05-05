// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_by_department_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductByDepartmentIdModelImpl _$$ProductByDepartmentIdModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductByDepartmentIdModelImpl(
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      desc: json['desc'] as String?,
      price: json['price'] as String?,
      type: json['type'] as String?,
      id: json['id'] as String?,
      departmentId: json['departmentId'] as String?,
    );

Map<String, dynamic> _$$ProductByDepartmentIdModelImplToJson(
        _$ProductByDepartmentIdModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'desc': instance.desc,
      'price': instance.price,
      'type': instance.type,
      'id': instance.id,
      'departmentId': instance.departmentId,
    };
