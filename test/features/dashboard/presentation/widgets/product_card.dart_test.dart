import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:neversitup/features/dashboard/presentation/widgets/product_card.dart';

import '../../../../mocks/product_by_department_id.dart';

void main() {
  mockNetworkImagesFor(() {
    testWidgets('ProductCard displays all product details correctly',
        (WidgetTester tester) async {
      final product = productByDepartmentIdData.first;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ProductCard(item: product),
        ),
      ));

      expect(find.byType(CachedNetworkImage), findsOneWidget);
      expect(find.text(product.name!), findsOneWidget);
      expect(find.text(product.desc!), findsOneWidget);
      expect(find.text(product.price!), findsOneWidget);
    });
  });
}
