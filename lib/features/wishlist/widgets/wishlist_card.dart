import 'package:ahziyah_flutter/components/custom_dialog.dart';
import 'package:ahziyah_flutter/features/wishlist/controller/wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/wishlist_shoes.dart';
import '../../../core/helpers/route_helper.dart';

class WishlistCard extends StatelessWidget {
  final WishlistShoesModel item;

  const WishlistCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            item.image,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(item.name),
        subtitle: Text(item.brand),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete_outline,
            color: Colors.red,
          ),
          onPressed: () {
            Get.dialog(
              CustomDialog(
                title: 'Delete',
                message: 'You are about to remove this item from your wishlist',
                onConfirm: () =>
                    Get.find<WishlistController>().removeFromWishlist(item),
              ),
            );
          },
        ),
        onTap: () {
          Get.toNamed(
            RouteHelper.getProductRoute(slug: item.slug),
            arguments: {
              'slug': item.slug,
              'id': item.id,
            },
          );
        },
      ),
    );
  }
}
