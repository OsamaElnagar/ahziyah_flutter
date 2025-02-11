import 'package:ahziyah_flutter/features/product/model/shoes_response.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

part 'wishlist_shoes.g.dart';

@HiveType(typeId: 2) // Make sure this ID is unique
class WishlistShoesModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String slug;

  @HiveField(3)
  final String image;

  @HiveField(4)
  final String brand;

  WishlistShoesModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.brand,
  });

  factory WishlistShoesModel.fromProduct(Product product) => WishlistShoesModel(
        id: product.id,
        name: product.name,
        slug: product.slug,
        image: product.images.primary,
        brand: product.brand.name,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}
