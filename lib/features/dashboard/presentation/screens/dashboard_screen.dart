import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neversitup/features/dashboard/presentation/providers/dashboard_state_provider.dart';
import 'package:neversitup/features/dashboard/presentation/widgets/department_tile.dart';
import 'package:neversitup/features/dashboard/presentation/widgets/product_card.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDepartment = ref.watch(selectedDepartmentProvider);
    final departmentsProvider = ref.watch(fetchDepartmentsProvider);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(4),
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Department Carousel'),
              SizedBox(
                  child: departmentsProvider.when(
                data: (data) => CarouselSlider(
                  options: CarouselOptions(
                      height: 140.0,
                      viewportFraction: .4,
                      enableInfiniteScroll: false,
                      disableCenter: true,
                      padEnds: false,
                      pageSnapping: false),
                  items: data.map((department) {
                    return InkWell(
                      onTap: () {
                        ref.read(selectedDepartmentProvider.notifier).state =
                            department;
                      },
                      child: DepartmentTile(department: department),
                    );
                  }).toList(),
                ),
                error: (error, stackTrace) => const Text('error'),
                loading: () => const Text('...loading'),
              ))
            ]),
            if (selectedDepartment != null)
              Consumer(
                builder: (context, ref, child) {
                  final productByDepartment = ref.watch(
                      fetchProductByDepartmentIdProvider(
                          selectedDepartment.id!));
                  return productByDepartment.when(
                      data: (data) => Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                    'Product list : ${selectedDepartment.name}'),
                                GridView.builder(
                                  shrinkWrap: true,
                                  physics:
                                      const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 1,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10),
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    final item = data[index];
                                    return InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              titleTextStyle: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black),
                                              contentTextStyle: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black),
                                              title: const Text(
                                                  'Product Description'),
                                              content: Text('${item.desc}'),
                                              surfaceTintColor: Colors.white,
                                              backgroundColor: Colors.white,
                                              actionsAlignment:
                                                  MainAxisAlignment.center,
                                              actions: [
                                                TextButton(
                                                  child: const Text('Close'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        child: ProductCard(item: item));
                                  },
                                )
                              ]),
                      error: (error, stackTrace) => const Text('error'),
                      loading: () => const Text('...loading'));
                },
              )
          ],
        ),
      ),
    );
  }
}
