import 'package:ahziyah_flutter/components/custom_snackbar.dart';
import 'package:ahziyah_flutter/features/checkout/repo/checkout_repo.dart';
import 'package:get/get.dart';
import 'package:pretty_logger/pretty_logger.dart';

class CartController extends GetxController {
  final CheckoutRepository repository;
  CartController({required this.repository});

  final RxBool isLoading = false.obs;
  final RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;
  final RxDouble subtotal = 0.0.obs;
  final RxDouble shippingFee = 0.0.obs;
  final RxDouble discount = 0.0.obs;
  final RxDouble vat = 0.0.obs;
  final RxDouble total = 0.0.obs;
  final RxString couponCode = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCart();
  }

  Future<void> fetchCart() async {
    try {
      isLoading.value = true;
      final response = await repository.getCart();

      if (response.data['data'] != null) {
        final cartData = response.data['data'];
        cartItems.value =
            (cartData['items'] as List?)?.cast<Map<String, dynamic>>() ?? [];
        total.value = (cartData['total'] as num?)?.toDouble() ?? 0.0;
        calculateTotals();
      } else {
        cartItems.clear();
        total.value = 0.0;
      }
    } catch (e) {
      PLog.error('Failed to load cart: $e');
      Get.snackbar(
        'Error',
        'Failed to load cart',
        snackPosition: SnackPosition.BOTTOM,
      );
      cartItems.clear();
      total.value = 0.0;
    } finally {
      isLoading.value = false;
    }
  }

  void calculateTotals() {
    if (cartItems.isEmpty) {
      subtotal.value = 0.0;
      vat.value = 0.0;
      total.value = 0.0;
      return;
    }

    subtotal.value = cartItems.fold(
      0.0,
      (sum, item) {
        final price = (item['price'] as Map<String, dynamic>)['total'] as num;
        return sum + price.toDouble();
      },
    );

    vat.value = subtotal.value * 0.05; // Assuming 5% VAT
    total.value =
        subtotal.value + shippingFee.value - discount.value + vat.value;
  }

  Future<void> updateQuantity(int cartItemId, int quantity) async {
    try {
      await repository.updateQuantity(cartItemId, quantity);
      await fetchCart();
    } catch (e) {
      customSnackBar('Failed to update quantity');
    }
  }

  Future<void> removeItem(int cartItemId) async {
    try {
      await repository.removeItem(cartItemId);
      await fetchCart();
    } catch (e) {
      customSnackBar('Failed to remove item');
    }
  }

  Future<void> applyCoupon(String code) async {
    couponCode.value = code;
    // Mock discount for now
    discount(10.0);
    calculateTotals();
  }
}
