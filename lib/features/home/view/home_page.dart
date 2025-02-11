import 'package:ahziyah_flutter/features/home/controller/home_controller.dart';
import 'package:ahziyah_flutter/features/home/widgets/categories_section.dart';
import 'package:ahziyah_flutter/features/home/widgets/product_grid.dart';
import 'package:ahziyah_flutter/layout/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: XAppBar(),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final homeData = controller.homeData.value;
        if (homeData == null) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('No data available'),
              TextButton(
                onPressed: () async {
                  await controller.loadHome();
                },
                child: Text('Try again'),
              ),
            ],
          ));
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              CategoriesSection(
                cotegories: homeData.categories,
              ),
              ProductGrid(
                title: 'Featured Products',
                products: homeData.featuredProducts,
                badgeText: 'Featured',
                badgeColor: Colors.red,
              ),
              ProductGrid(
                title: 'Latest Arrivals',
                products: homeData.latestProducts,
                badgeText: 'New',
                badgeColor: Colors.green,
              ),
              ProductGrid(
                title: 'Popular Products',
                products: homeData.popularProducts,
                badgeText: 'Popular',
                badgeColor: Colors.blue,
              ),
              SizedBox(
                height: 130,
              )
            ],
          ),
        );
      }),
    );
  }
}
