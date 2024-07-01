import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ptc_quiz2/core/widgets/custom_button.dart';

import '../../../../core/assets/app_png.dart';
import '../../../../core/helper/data_time_helper.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/values_manager.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../data/model/order_model.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    super.key,
    required this.model,
  });

  final OrderModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const CustomImage(),

          /// uuid V1 it too long ...!
          /// we use [Text.rich]
          trailing: Text(
            'ID: #${model.orderId.substring(0, 7)}',
            style: AppTextStyle.f12w600blueGrey,
          ),
          title: Text(
            model.firstItemName,
            style: AppTextStyle.f14w400grey,
          ),
          subtitle: Text(
            '\$${model.totalPrice.toStringAsFixed(2)}',
            style: AppTextStyle.f14w600darkBlue,
          ),
        ),
        if (model.status.isSuccess)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                DateTimeHelper.formatShortDate(model.orderDate),
                style: AppTextStyle.f14w400grey,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p12,
                  vertical: AppPadding.p4,
                ),
                decoration: BoxDecoration(
                  color: AppColor.deepBlue.withAlpha(50),
                  borderRadius: BorderRadius.circular(AppSize.s6),
                ),
                child: Text(
                  model.status.name,
                  style: AppTextStyle.f14w500deepBlue,
                ),
              ),
            ],
          ),
        if (!model.status.isSuccess)
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(AppPng.delivery),
                    Container(
                      height: AppSize.s44,
                      width: AppSize.s44,
                      padding: const EdgeInsets.all(AppPadding.p6),
                      decoration: BoxDecoration(
                        color: AppColor.lightGrey,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColor.white, width: 4),
                        boxShadow: const [
                          BoxShadow(
                            color: AppColor.lightGrey,
                            blurRadius: 50,
                          ),
                        ],
                      ),
                      child: const FittedBox(
                        child: CustomImage(
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Your ${model.firstItemName}',
                            style: AppTextStyle.f20w400darkGrey,
                          ),
                          const TextSpan(
                            text: '\nare on the way',
                            style: AppTextStyle.f20w700darkGrey,
                          ),
                        ],
                      ),
                    ),
                    const Gap(12),
                    CustomButton(
                      onPressed: () {},
                      size: const Size(double.infinity, 56),
                      child: const Text(
                        'Track Order',
                        style: AppTextStyle.f14w600white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
      ],
    );
  }
}
