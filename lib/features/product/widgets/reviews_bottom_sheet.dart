import 'package:ahziyah_flutter/features/product/model/shoes_response.dart';
import 'package:ahziyah_flutter/features/product/widgets/review_item.dart';
import 'package:ahziyah_flutter/utils/dimensions.dart';
import 'package:flutter/material.dart';

class ReviewsBottomSheet extends StatelessWidget {
  final List<Review> reviews;

  const ReviewsBottomSheet({
    super.key,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Text(
            'Customer Reviews',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeDefault,
            ),
            itemCount: reviews.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) => ReviewItem(review: reviews[index]),
          ),
        ),
      ],
    );
  }
}
