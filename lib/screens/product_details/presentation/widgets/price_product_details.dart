import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/values_manager.dart';
import '../../../home_screen/models/product.dart';

class PriceProductDetails extends StatelessWidget {
  const PriceProductDetails({
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
          Expanded(
            child: Text(
              '\$${product.priceAfterDiscount}',
              style: AppTextStyle.f16w600deepBlue,
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(AppPadding.p8),
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(AppSize.s20),
                ),
                child: Text(
                  '\$${product.discount} OFF',
                  style: AppTextStyle.f12w400white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              'Reg: ${product.price}',
              style: AppTextStyle.f14w500blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}
