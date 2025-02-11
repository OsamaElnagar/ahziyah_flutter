import 'package:ahziyah_flutter/components/custom_snackbar.dart';
import 'package:ahziyah_flutter/core/helpers/route_helper.dart';
import 'package:ahziyah_flutter/features/product/model/shoes_response.dart';
import 'package:ahziyah_flutter/features/product/repo/product_repo.dart';
import 'package:ahziyah_flutter/features/checkout/repo/checkout_repo.dart';
import 'package:get/get.dart';
import 'package:pretty_logger/pretty_logger.dart';

import '../../checkout/controller/cart_controller.dart';

class ShoesController extends GetxController {
  final ProductRepo repo;
  final CheckoutRepository checkoutRepo;

  ShoesController({
    required this.repo,
    required this.checkoutRepo,
  });

  static ShoesController instance({String? tag}) =>
      Get.find<ShoesController>(tag: tag);

  final _isLoading = false.obs;
  final _product = Rxn<Product>();
  final _relatedProducts = Rxn<RelatedProducts>();
  final _selectedSize = RxnInt();
  final _quantity = 1.obs;

  bool get isLoading => _isLoading.value;
  Product? get product => _product.value;
  RelatedProducts? get relatedProducts => _relatedProducts.value;
  int? get selectedSize => _selectedSize.value;
  int get quantity => _quantity.value;

  String? get selectedSizeName {
    if (_selectedSize.value == null || _product.value == null) return null;
    return _product.value!.sizes[_selectedSize.value!].name;
  }

  String? get selectedSizeRegion {
    if (_selectedSize.value == null || _product.value == null) return null;
    return _product.value!.sizes[_selectedSize.value!].region;
  }

  @override
  void onInit() {
    super.onInit();
    // Listen to changes in selectedSize
    ever(_selectedSize, (_) => update());
  }

  Future<void> getProduct(String slug) async {
    try {
      _isLoading.value = true;
      clearSelections();

      final response = await repo.getProduct(slug);
      final productResponse = ProductResponse.fromJson(response.data);
      _product.value = productResponse.data.product;
      _relatedProducts.value = productResponse.data.relatedProducts;
      update(); // Ensure UI updates after new product is loaded
    } catch (e) {
      PLog.error(e.toString());
    } finally {
      _isLoading.value = false;
    }
  }

  void setSelectedSize(int index) {
    _selectedSize.value = index;
    // No need for update() here as we're using ever() listener
  }

  void incrementQuantity() {
    _quantity.value++;
  }

  void decrementQuantity() {
    if (_quantity.value > 1) {
      _quantity.value--;
    }
  }

  Future<void> addToCart() async {
    if (_selectedSize.value == null || product == null) {
      customSnackBar('Please select a size first');
      return;
    }

    try {
      final sizeId = product!.sizes[_selectedSize.value!].id;
      await checkoutRepo.addToCart({
        'product_id': product!.id,
        'size_id': sizeId,
        'quantity': quantity,
      });

      clearSelections(clearProduct: false);

      customSnackBar(
        'Product added to cart',
        isError: false,
        actionLabel: 'View Cart',
        onTap: () => Get.toNamed(RouteHelper.getCartRoute()),
      );
      Get.find<CartController>().fetchCart();
    } catch (e) {
      customSnackBar('Failed to add to cart');
    }
  }

  void clearSelections({bool clearProduct = true}) {
    _selectedSize.value = null;
    _quantity.value = 1;
    if (clearProduct) _product.value = null;
    update();
  }

  @override
  void onClose() {
    clearSelections();
    super.onClose();
  }

  // Review Statistics
  int getStarCount(int star) {
    if (product == null) return 0;
    return product!.reviews.where((review) => review.rating == star).length;
  }

  Map<String, dynamic> getReviewStatistics() {
    if (product == null) {
      return {
        'rating': 0.0,
        'numOfReviews': 0,
        'fiveStar': 0,
        'fourStar': 0,
        'threeStar': 0,
        'twoStar': 0,
        'oneStar': 0,
      };
    }

    return {
      'rating': product!.rating.average,
      'numOfReviews': product!.rating.count,
      'fiveStar': getStarCount(5),
      'fourStar': getStarCount(4),
      'threeStar': getStarCount(3),
      'twoStar': getStarCount(2),
      'oneStar': getStarCount(1),
    };
  }
}
