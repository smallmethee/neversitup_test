import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:neversitup/features/dashboard/presentation/widgets/department_tile.dart';
import 'package:neversitup/shared/domain/models/departments/department_model.dart';

class MockDepartmentModel extends Mock implements DepartmentModel {}

void main() {
  setUpAll(() {
    registerFallbackValue(MockDepartmentModel());
  });

  testWidgets('DepartmentTile displays department name correctly',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      final department = MockDepartmentModel();
      when(() => department.name).thenReturn('Recycled Plastic Tuna');
      when(() => department.imageUrl)
          .thenReturn('https://loremflickr.com/640/480');

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: DepartmentTile(department: department),
        ),
      ));

      expect(find.text('Recycled Plastic Tuna'), findsOneWidget);
      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });
  });
}
