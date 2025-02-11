import 'package:ahziyah_flutter/features/product/model/shoes_response.dart';
import 'package:ahziyah_flutter/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class ReviewItem extends StatelessWidget {
  final Review review;

  const ReviewItem({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: Text(
                review.user.name[0].toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: Dimensions.paddingSizeSmall),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.user.name,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    DateFormat('MMM dd, yyyy').format(review.createdAt),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: Dimensions.paddingSizeSmall),
        RatingBar.builder(
          initialRating: review.rating.toDouble(),
          itemSize: 16,
          ignoreGestures: true,
          glow: false,
          unratedColor:
              Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.08),
          itemBuilder: (context, _) =>
              SvgPicture.asset("assets/icons/Star_filled.svg"),
          onRatingUpdate: (_) {},
        ),
        const SizedBox(height: Dimensions.paddingSizeSmall),
        Text(review.comment),
        const SizedBox(height: Dimensions.paddingSizeDefault),
      ],
    );
  }
}
