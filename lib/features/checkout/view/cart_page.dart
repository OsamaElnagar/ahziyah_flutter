import 'package:ahziyah_flutter/components/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../controller/cart_controller.dart';
import '../widgets/cart_empty_state.dart';
import '../widgets/cart_item.dart';
import '../widgets/cart_coupon_section.dart';
import '../widgets/cart_order_summary.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review your cart'),
        actions: [
          IconButton(
            icon: const Icon(IconlyLight.more_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.cartItems.isEmpty) {
          return const CartEmptyState();
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: controller.cartItems.length,
                itemBuilder: (context, index) {
                  final item = controller.cartItems[index];
                  final product = item['product'] as Map<String, dynamic>;

                  return CartItem(
                    imageUrl: product['image'] ?? '',
                    brand:
                        'Nike', // You might want to add brand to the API response
                    name: product['name'] ?? 'Unknown Product',
                    price: item['price'] as Map<String, dynamic>,
                    quantity: item['quantity'] as int,
                    size: item['size'] as Map<String, dynamic>,
                    onRemove: () => Get.dialog(
                      CustomDialog(
                        title: 'Remove From Cart',
                        message:
                            'You are about to remove this item from your cart. Are you sure?',
                        onConfirm: () {
                          controller.removeItem(item['id'] as int);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            if (controller.cartItems.isNotEmpty) ...[
              const CartCouponSection(),
              const CartOrderSummary(),
            ],
          ],
        );
      }),
    );
  }
}
