import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/values_manager.dart';
import '../../../home_screen/models/product.dart';

class RatingReviewsBarProduct extends StatelessWidget {
  const RatingReviewsBarProduct({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p8),
      child: Row(
        children: [
          RatingBar.builder(
            initialRating: product.rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 22,
            itemPadding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p4,
            ),
            itemBuilder: (_, __) => const Icon(
              Icons.star,
              color: AppColor.gold,
            ),
            onRatingUpdate: (rating) {},
          ),
          const Gap(AppSize.s16),
          Text(
            '${product.countReviews} Reviews',
            style: AppTextStyle.f18w500lightBlueGrey,
          )
        ],
      ),
    );
  }
}
