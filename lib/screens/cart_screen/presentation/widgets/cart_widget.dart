import 'package:flutter/material.dart';

import '../../../../core/assets/app_svg.dart';
import '../../../../core/data/cart/cart_manager.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/custom_svg_icon_button.dart';
import '../../../home_screen/models/product.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
    super.key,
    required this.model,
    required this.onProductRemoved,
  });

  final ProductModel model;
  final ValueChanged<String> onProductRemoved;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CustomImage(),
      title: Text(
        model.name,
        style: AppTextStyle.f16w600darkGrey,
      ),
      subtitle: Text(
        model.priceAfterDiscount.toString(),
        style: AppTextStyle.f14w500blueGrey,
      ),
      trailing: StatefulBuilder(
        builder: (context, setState) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomIconButton(
                path: AppSvg.minus,
                backgroundColor: AppColor.fontColor,
                onTap: () {
                  final amount = CartManager().getAmount(model.id) - 1;
                  if (amount < 0) return;
                  CartManager().store(model.id, amount);
                  if (amount == 0) onProductRemoved(model.id);
                  setState(() {});
                },
              ),
              Text(
                CartManager().getAmount(model.id).toString(),
                style: AppTextStyle.f16w600darkGrey,
              ),
              CustomIconButton(
                path: AppSvg.plusSmall,
                backgroundColor: AppColor.fontColor,
                onTap: () {
                  final amount = CartManager().getAmount(model.id) + 1;

                  /// we should handel limit of available amount
                  /// if (amount >= limit) return;
                  CartManager().store(model.id, amount);
                  setState(() {});
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
