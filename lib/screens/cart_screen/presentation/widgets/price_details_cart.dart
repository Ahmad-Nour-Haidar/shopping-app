import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ptc_quiz2/core/extensions/build_context_extensions.dart';

import '../../../../core/data/cart/cart_manager.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/values_manager.dart';
import '../../../../core/widgets/custom_button.dart';
import 'row_price.dart';

class PriceDetailsCart extends StatelessWidget {
  const PriceDetailsCart({
    super.key,
    required this.buttonTitle,
    required this.onTap,
  });

  final String buttonTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p20),
      decoration: const BoxDecoration(
        color: AppColor.backgroundCategory,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSize.s30),
          topRight: Radius.circular(AppSize.s30),
        ),
      ),
      child: ValueListenableBuilder(
        valueListenable: CartManager().cartPriceCartDetails,
        builder: (context, PriceCartDetails value, child) {
          return Column(
            children: <Widget>[
              RowPrice(
                title: 'Sub total: ',
                price: value.subTotal.toStringAsFixed(2),
              ),
              RowPrice(
                title: 'Delivery: ',
                price: value.delivery.toStringAsFixed(2),
              ),
              RowPrice(
                title: 'Total: ',
                price: value.total.toStringAsFixed(2),
              ),
              const Gap(16),
              CustomButton(
                onPressed: onTap,
                size: Size(context.width * .8, 56),
                child: Text(
                  buttonTitle,
                  style: AppTextStyle.f16w600white,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
