import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/values_manager.dart';
import '../../data/models/address_model.dart';

class AddressCardWidget extends StatelessWidget {
  const AddressCardWidget({
    super.key,
    required this.model,
    required this.onTap,
    required this.isSelected,
  });

  final ValueChanged<String> onTap;
  final bool isSelected;
  final AddressModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppSize.s12),
      onTap: () => onTap(model.id),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s12),
          border: Border.all(
            width: 3,
            color: isSelected ? AppColor.gold : AppColor.lightBlueGrey,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  model.title,
                  style: AppTextStyle.f16w600darkGrey,
                ),
                Checkbox(
                  value: isSelected,
                  checkColor: AppColor.black,
                  activeColor: AppColor.gold,
                  shape: const CircleBorder(),
                  onChanged: (_) => onTap(model.id),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  model.street,
                  style: AppTextStyle.f16w400darkGrey,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Edit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}