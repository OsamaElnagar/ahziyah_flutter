import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/responsive.dart';
import '../../home/widgets/product_card.dart';
import '../controllers/discover_controller.dart';

class DiscoverContent extends StatelessWidget {
  final DiscoverController controller;

  const DiscoverContent({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      return CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Responsive.isMobile(context) ? 3 : 4,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.58,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => ProductCard(
                  product: controller.products[index],
                  badgeColor: Colors.transparent,
                  badgeText: '',
                ),
                childCount: controller.products.length,
              ),
            ),
          ),
        ],
      );
    });
  }
}
