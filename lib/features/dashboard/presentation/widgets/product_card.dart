import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:neversitup/shared/domain/models/products/product_by_department_id_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.item});

  final ProductByDepartmentIdModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black54, width: 1),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
            height: 120,
            width: double.infinity,
            child:
                CachedNetworkImage(fit: BoxFit.fill, imageUrl: item.imageUrl!)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text('${item.name}',
              maxLines: 1, style: const TextStyle(overflow: TextOverflow.clip)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text('${item.desc}',
              maxLines: 2,
              style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                  overflow: TextOverflow.ellipsis)),
        ),
        Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text('${item.price}'),
            )),
      ]),
    );
  }
}
