import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:ptc_quiz2/core/assets/app_svg.dart';
import 'package:ptc_quiz2/core/constant/app_keys.dart';
import 'package:ptc_quiz2/core/theme/app_color.dart';
import 'package:ptc_quiz2/core/theme/app_text_style.dart';
import 'package:ptc_quiz2/core/widgets/svg_image.dart';
import 'package:ptc_quiz2/routers.dart';

import '../../../../core/data/cart/cart_manager.dart';
import '../../../../core/utils/values_manager.dart';
import '../../models/product.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(
        AppRouter.productDetailsScreen,
        extra: {
          AppKeys.productId: product.id,
        },
      ),
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p12),
        width: AppSize.s130,
        decoration: BoxDecoration(
          color: AppColor.fontColor,
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              child: Icon(
                Icons.image_outlined,
                size: AppSize.s55,
                color: AppColor.lightGrey,
              ),
            ),
            StatefulBuilder(
              builder: (BuildContext context,
                  void Function(void Function()) setState) {
                final amount = CartManager().getAmount(product.id);
                return BuildCounterButton(
                  count: amount,
                  onTap: () {
                    setState(() {
                      CartManager().store(product.id, amount + 1);
                    });
                  },
                );
              },
            ),
            Text(
              product.name,
              style: AppTextStyle.f14w600darkBlue,
            ),
            Text(
              '\$${product.price}',
              style: AppTextStyle.f14w600darkBlue,
            ),
            Text(
              '${product.category} ' * 2,
              style: AppTextStyle.f12w600blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomPlusButton extends StatelessWidget {
  const CustomPlusButton({
    super.key,
    required this.height,
    required this.onTap,
  });

  final double height;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(height / 2),
      onTap: onTap,
      child: Container(
        height: height,
        width: height,
        decoration: BoxDecoration(
          color: AppColor.deepBlue,
          borderRadius: BorderRadius.circular(height / 2),
        ),
        child: const SvgImage(
          path: AppSvg.plusSmall,
          size: AppSize.s22,
          color: AppColor.white,
        ),
      ),
    );
  }
}

class BuildCounterButton extends StatelessWidget {
  const BuildCounterButton({
    super.key,
    required this.count,
    required this.onTap,
  });

  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const height = 24.0;
    return Card(
      child: Container(
        height: height,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(height / 2),
        ),
        child: Row(
          children: [
            const Gap(16),
            Text(
              count.toString(),
              style: AppTextStyle.f14w600darkBlue,
            ),
            const Spacer(),
            CustomPlusButton(
              height: height,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
