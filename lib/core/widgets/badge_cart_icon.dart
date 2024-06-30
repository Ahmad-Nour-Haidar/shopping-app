import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;

import '../assets/app_svg.dart';
import '../data/cart/cart_manager.dart';
import '../theme/app_color.dart';
import '../theme/app_text_style.dart';
import '../utils/values_manager.dart';
import 'svg_image.dart';

class BadgeCartIcon extends StatelessWidget {
  const BadgeCartIcon({
    super.key,
   this.cartIconColor = AppColor.white,
  });

  final Color cartIconColor;

  @override
  Widget build(BuildContext context) {
    return Badge(
      badgeStyle: BadgeStyle(
        shape: BadgeShape.circle,
        badgeColor: AppColor.gold,
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
      badgeContent: ValueListenableBuilder<int>(
        valueListenable: CartManager().cartCountController,
        builder: (context, value, child) {
          return Text(
            value.toString(),
            style: AppTextStyle.f14w600white,
          );
        },
      ),
      position: BadgePosition.custom(
        top: -AppSize.s15,
        end: -AppSize.s15,
      ),
      child: SvgImage(
        path: AppSvg.cart,
        size: AppSize.s18,
        color: cartIconColor,
      ),
    );
  }
}
