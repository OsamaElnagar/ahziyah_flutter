import 'package:ahziyah_flutter/components/cart_button.dart';
import 'package:ahziyah_flutter/components/custom_modal_bottom_sheet.dart';
import 'package:ahziyah_flutter/components/review_card.dart';
import 'package:ahziyah_flutter/features/product/controller/shoes_controller.dart';
import 'package:ahziyah_flutter/features/product/widgets/product_details_bottom_sheet.dart';
import 'package:ahziyah_flutter/features/product/widgets/product_images.dart';
import 'package:ahziyah_flutter/features/product/widgets/product_returns.dart';
import 'package:ahziyah_flutter/features/product/widgets/review_item.dart';
import 'package:ahziyah_flutter/features/product/widgets/reviews_bottom_sheet.dart';
import 'package:ahziyah_flutter/features/product/widgets/shoes_card.dart';
import 'package:ahziyah_flutter/utils/dimensions.dart';
import 'package:animate_do/animate_do.dart' as animate;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../wishlist/controller/wishlist_controller.dart';
import '../widgets/product_info.dart';
import '../widgets/product_list_tile.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ShoesController controller = Get.find<ShoesController>();
  final WishlistController wishlistController = Get.find<WishlistController>();
  final String slug = Get.arguments['slug'];

  @override
  void initState() {
    super.initState();
    // Use addPostFrameCallback to ensure the widget is fully built before making the API call
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getProduct(slug);
    });
  }

  void _showSizeSelector() {
    customModalBottomSheet(
      context,
      height: MediaQuery.of(context).size.height * 0.92,
      child: ProductDetailsBottomSheet(
        product: controller.product!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(
        () => controller.product != null
            ? animate.FadeInUp(
                child: CartButton(
                  price: controller.product!.price.amount,
                  selectedSize: controller.selectedSizeName,
                  selectedRegion: controller.selectedSizeRegion,
                  press: controller.selectedSize != null
                      ? controller.addToCart
                      : _showSizeSelector,
                ),
              )
            : const SizedBox(),
      ),
      body: Obx(
        () => controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : controller.product == null
                ? const Center(child: Text('Product not found'))
                : SafeArea(
                    child: CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          floating: true,
                          actions: [
                            Obx(
                              () => IconButton(
                                onPressed: () {
                                  if (controller.product != null) {
                                    wishlistController
                                        .toggleWishlist(controller.product!);
                                  }
                                },
                                icon: Icon(
                                  IconlyLight.heart,
                                  color: wishlistController.isInWishlist(
                                          controller.product?.id ?? -1)
                                      ? Colors.red
                                      : Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color!,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ProductImages(
                          images:
                              controller.product!.images.all.values.toList(),
                        ),
                        ProductInfo(
                          brand: controller.product!.brand.name,
                          title: controller.product!.name,
                          isAvailable: true,
                          description: controller.product!.description,
                          rating: controller.product!.rating.average,
                          numOfReviews: controller.product!.rating.count,
                        ),
                        // Review Statistics Card
                        SliverPadding(
                          padding: const EdgeInsets.all(
                              Dimensions.paddingSizeDefault),
                          sliver: SliverToBoxAdapter(
                            child: ReviewCard(
                              rating: controller.product!.rating.average,
                              numOfReviews: controller.product!.rating.count,
                              numOfFiveStar: controller.getStarCount(5),
                              numOfFourStar: controller.getStarCount(4),
                              numOfThreeStar: controller.getStarCount(3),
                              numOfTwoStar: controller.getStarCount(2),
                              numOfOneStar: controller.getStarCount(1),
                            ),
                          ),
                        ),
                        ProductListTile(
                          svgSrc: "assets/icons/Product.svg",
                          title: "Product Details",
                          press: () {
                            customModalBottomSheet(
                              context,
                              height: MediaQuery.of(context).size.height * 0.92,
                              child: SizedBox(),
                            );
                          },
                        ),
                        if (controller.product!.reviews.isNotEmpty) ...[
                          SliverPadding(
                            padding:
                                EdgeInsets.all(Dimensions.paddingSizeDefault),
                            sliver: SliverToBoxAdapter(
                              child: ReviewItem(
                                review: controller.product!.reviews.first,
                              ),
                            ),
                          ),
                        ],
                        ProductListTile(
                          svgSrc: "assets/icons/Return.svg",
                          title: "Returns",
                          isShowBottomBorder: true,
                          press: () {
                            customModalBottomSheet(
                              context,
                              height: MediaQuery.of(context).size.height * 0.92,
                              child: const ProductReturns(),
                            );
                          },
                        ),
                        // Reviews List Tile
                        ProductListTile(
                          svgSrc: "assets/icons/Chat.svg",
                          title: "Reviews",
                          isShowBottomBorder: true,
                          press: () {
                            customModalBottomSheet(
                              context,
                              height: MediaQuery.of(context).size.height * 0.92,
                              child: ReviewsBottomSheet(
                                reviews: controller.product!.reviews,
                              ),
                            );
                          },
                        ),

                        if (controller.relatedProducts?.category.products
                                .isNotEmpty ??
                            false)
                          SliverToBoxAdapter(
                            child: SizedBox(
                              height: 270,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(
                                        Dimensions.paddingSizeDefault),
                                    child: Text(
                                      controller
                                          .relatedProducts!.category.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller.relatedProducts!
                                          .category.products.length,
                                      itemBuilder: (context, index) {
                                        final product = controller
                                            .relatedProducts!
                                            .category
                                            .products[index];
                                        return Padding(
                                          padding: EdgeInsets.only(
                                            left: Dimensions.paddingSizeDefault,
                                            right: index ==
                                                    controller
                                                            .relatedProducts!
                                                            .category
                                                            .products
                                                            .length -
                                                        1
                                                ? Dimensions.paddingSizeDefault
                                                : 0,
                                          ),
                                          child: ShoesCard(
                                            product: product,
                                            updateInPlace: true,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (controller
                                .relatedProducts?.brand.products.isNotEmpty ??
                            false)
                          SliverToBoxAdapter(
                            child: SizedBox(
                              height: 270,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(
                                        Dimensions.paddingSizeDefault),
                                    child: Text(
                                      controller.relatedProducts!.brand.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller.relatedProducts!
                                          .brand.products.length,
                                      itemBuilder: (context, index) {
                                        final product = controller
                                            .relatedProducts!
                                            .brand
                                            .products[index];
                                        return Padding(
                                          padding: EdgeInsets.only(
                                            left: Dimensions.paddingSizeDefault,
                                            right: index ==
                                                    controller
                                                            .relatedProducts!
                                                            .brand
                                                            .products
                                                            .length -
                                                        1
                                                ? Dimensions.paddingSizeDefault
                                                : 0,
                                          ),
                                          child: ShoesCard(
                                            product: product,
                                            updateInPlace: true,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        const SliverToBoxAdapter(
                          child:
                              SizedBox(height: Dimensions.paddingSizeDefault),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
