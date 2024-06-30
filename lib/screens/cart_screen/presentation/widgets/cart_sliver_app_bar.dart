import 'package:flutter/material.dart';
import 'package:ptc_quiz2/core/extensions/build_context_extensions.dart';

import '../../../../core/assets/app_svg.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/values_manager.dart';
import '../../../../core/widgets/svg_image.dart';

class CartSliverAppBar extends StatelessWidget {
  const CartSliverAppBar({
    super.key,
    required this.productCount,
  });

  final int productCount;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColor.yellow,
      pinned: true,
      floating: false,
      expandedHeight: AppSize.s250,
      // automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: Size(context.width, 55),
        child: Container(
          color: AppColor.gold,
          width: context.width,
          padding: const EdgeInsets.all(AppPadding.p12),
          child: const FittedBox(
            fit: BoxFit.scaleDown,

            /// we should use [Text.rich] for {#HalalFood}
            child: Text(
              'Use code #HalalFood at Checkout',
              style: AppTextStyle.f16w600darkGrey,
            ),
          ),
        ),
      ),
      title: Text(
        'Shopping Cart ($productCount)',
      ),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        background: Stack(
          alignment: Alignment.center,
          children: [
            SvgImage(
              size: context.width * .8,
              path: AppSvg.hash,
              color: AppColor.gold,
            ),
            Positioned(
              top: 80,
              right: 20,
              child: SvgImage(
                size: context.width * .25,
                path: AppSvg.blackLine,
                color: AppColor.black,
              ),
            ),
            const Positioned(
              bottom: 25,
              right: 0,
              child: Text(
                '25 %',
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 110,
                  fontWeight: FontWeight.w800,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}