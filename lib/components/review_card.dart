import 'package:ahziyah_flutter/theme/app_colors.dart';
import 'package:ahziyah_flutter/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.rating,
    required this.numOfReviews,
    this.numOfFiveStar = 0,
    this.numOfFourStar = 0,
    this.numOfThreeStar = 0,
    this.numOfTwoStar = 0,
    this.numOfOneStar = 0,
  });

  final double rating;
  final int numOfReviews;
  final int numOfFiveStar,
      numOfFourStar,
      numOfThreeStar,
      numOfTwoStar,
      numOfOneStar;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.035),
        borderRadius:
            const BorderRadius.all(Radius.circular(Dimensions.radiusDefault)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    text: "$rating ",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: "/5",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                Text("Based on $numOfReviews Reviews"),
                const SizedBox(height: Dimensions.paddingSizeDefault),
                RatingBar.builder(
                  initialRating: rating,
                  itemSize: 20,
                  itemPadding: const EdgeInsets.only(
                      right: Dimensions.paddingSizeDefault / 4),
                  unratedColor: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .color!
                      .withOpacity(0.08),
                  glow: false,
                  allowHalfRating: true,
                  ignoreGestures: true,
                  onRatingUpdate: (value) {},
                  itemBuilder: (context, index) =>
                      SvgPicture.asset("assets/icons/Star_filled.svg"),
                ),
              ],
            ),
          ),
          const SizedBox(width: Dimensions.paddingSizeDefault),
          Expanded(
            child: Column(
              children: [
                RateBar(star: 5, value: numOfFiveStar / numOfReviews),
                RateBar(star: 4, value: numOfFourStar / numOfReviews),
                RateBar(star: 3, value: numOfThreeStar / numOfReviews),
                RateBar(star: 2, value: numOfTwoStar / numOfReviews),
                RateBar(star: 1, value: numOfOneStar / numOfReviews),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RateBar extends StatelessWidget {
  const RateBar({
    super.key,
    required this.star,
    required this.value,
  });

  final int star;
  final double value;

  @override
  Widget build(BuildContext context) {
    // Calculate progress value, default to 0 if numOfReviews is 0
    final progressValue = value.isFinite ? value : 0.0;

    return Padding(
      padding: EdgeInsets.only(
          bottom: star == 1 ? 0 : Dimensions.paddingSizeDefault / 2),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Text(
              "$star Star",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).textTheme.bodyMedium!.color),
            ),
          ),
          const SizedBox(width: Dimensions.paddingSizeDefault / 2),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(Dimensions.radiusDefault),
              ),
              child: LinearProgressIndicator(
                minHeight: 6,
                color: AppColors.secondaryPeach,
                backgroundColor: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .color!
                    .withOpacity(0.05),
                value: progressValue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
