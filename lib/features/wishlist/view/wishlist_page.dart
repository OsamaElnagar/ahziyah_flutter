import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../layout/widgets/app_bar.dart';
import '../controller/wishlist_controller.dart';
import '../widgets/wishlist_card.dart';

class WishlistPage extends GetView<WishlistController> {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: XAppBar(),
      body: Obx(
        () => controller.wishlistItems.isEmpty
            ? const Center(
                child: Text('Your wishlist is empty'),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: controller.wishlistItems.length,
                itemBuilder: (context, index) {
                  final item = controller.wishlistItems[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: WishlistCard(item: item),
                  );
                },
              ),
      ),
    );
  }
}
