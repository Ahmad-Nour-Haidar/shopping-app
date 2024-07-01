import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/values_manager.dart';
import '../../data/model/order_model.dart';

class CustomTap extends StatelessWidget {
  const CustomTap({
    super.key,
    required this.currentStatus,
    required this.onTap,
  });

  final ValueChanged<OrderModelStatus> onTap;
  final OrderModelStatus currentStatus;

  /// we can create a Model
  static const _tabs = {
    'Current': OrderModelStatus.pending,
    'Past': OrderModelStatus.success,
  };

  @override
  Widget build(BuildContext context) {
    const height = AppSize.s44;
    const radius = height / 2;
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding:
            const EdgeInsets.symmetric(horizontal: AppPadding.screenPadding),
        itemCount: _tabs.length,
        separatorBuilder: (_, __) => const Gap(16),
        itemBuilder: (_, index) {
          final item = _tabs.entries.elementAtOrNull(index)!;
          final isSelected = item.value == currentStatus;
          final style =
              isSelected ? AppTextStyle.f16w600white : AppTextStyle.f16w600grey;
          return InkWell(
            borderRadius: BorderRadius.circular(radius),
            onTap: () {
              if (item.value == currentStatus) return;
              onTap(item.value);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: isSelected ? AppSize.s170 : AppSize.s150,
              height: height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? AppColor.gold : AppColor.transparent,
                borderRadius: BorderRadius.circular(radius),
                border: !isSelected
                    ? Border.all(
                        color: AppColor.lightBlueGrey,
                      )
                    : null,
              ),
              child: Text(
                item.key,
                style: style,
              ),
            ),
          );
        },
      ),
    );
  }
}
