import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:neversitup/shared/domain/models/departments/department_model.dart';

class DepartmentTile extends StatelessWidget {
  const DepartmentTile({super.key, required this.department});
  final DepartmentModel department;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black54, width: 1)),
      margin: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: department.imageUrl!,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${department.name}',
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
