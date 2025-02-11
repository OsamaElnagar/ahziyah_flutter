import 'package:ahziyah_flutter/utils/dimensions.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.title,
    required this.brand,
    required this.description,
    required this.rating,
    required this.numOfReviews,
    required this.isAvailable,
  });

  final String title, brand, description;
  final double rating;
  final int numOfReviews;
  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
      sliver: SliverToBoxAdapter(
        child: FadeInDown(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                brand.toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: Dimensions.paddingSizeDefault / 2),
              Text(
                title,
                maxLines: 2,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: Dimensions.paddingSizeDefault),
              Row(
                children: [
                  const Spacer(),
                  SvgPicture.asset("assets/icons/Star_filled.svg"),
                  const SizedBox(width: Dimensions.paddingSizeDefault / 4),
                  Text(
                    "$rating ",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text("($numOfReviews Reviews)")
                ],
              ),
              const SizedBox(height: Dimensions.paddingSizeDefault),
              Text(
                "Product info",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: Dimensions.paddingSizeDefault / 2),
              Text(
                description,
                style: const TextStyle(height: 1.4),
              ),
              const SizedBox(height: Dimensions.paddingSizeDefault / 2),
            ],
          ),
        ),
      ),
    );
  }
}
