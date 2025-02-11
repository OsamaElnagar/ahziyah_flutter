import 'package:ahziyah_flutter/features/product/model/shoes_response.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../model/wishlist_shoes.dart';

class WishlistController extends GetxController {
  static const String boxName = 'wishlist';
  final _wishlistItems = <WishlistShoesModel>[].obs;

  List<WishlistShoesModel> get wishlistItems => _wishlistItems;

  @override
  void onInit() {
    super.onInit();
    _loadWishlist();
  }

  Future<void> _loadWishlist() async {
    final box = await Hive.openBox<WishlistShoesModel>(boxName);
    _wishlistItems.value = box.values.toList();
  }

  Future<void> toggleWishlist(Product product) async {
    final box = await Hive.openBox<WishlistShoesModel>(boxName);

    final existingIndex =
        _wishlistItems.indexWhere((item) => item.id == product.id);

    if (existingIndex >= 0) {
      await box.deleteAt(existingIndex);
      _wishlistItems.removeAt(existingIndex);
    } else {
      final wishlistItem = WishlistShoesModel.fromProduct(product);
      await box.add(wishlistItem);
      _wishlistItems.add(wishlistItem);
    }
  }

  bool isInWishlist(int productId) {
    return _wishlistItems.any((item) => item.id == productId);
  }

  Future<void> removeFromWishlist(WishlistShoesModel item) async {
    final box = await Hive.openBox<WishlistShoesModel>(boxName);
    final index = _wishlistItems.indexWhere((element) => element.id == item.id);
    if (index >= 0) {
      await box.deleteAt(index);
      _wishlistItems.removeAt(index);
    }
  }
}
