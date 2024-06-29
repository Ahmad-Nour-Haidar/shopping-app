import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/theme/app_text_style.dart';
import '../../../home_screen/models/product.dart';

class DetailsProduct extends StatelessWidget {
  const DetailsProduct({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(16),
        const Text(
          'Details',
          style: AppTextStyle.f16w600darkGrey,
        ),
        const Gap(8),
        Text(
          product.details,
          style: AppTextStyle.f16w400darkGrey,
        ),
      ],
    );
  }
}
