import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/values_manager.dart';
import '../../model/onboarding_item.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    super.key,
    required this.item,
  });

  final OnboardingItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          item.title,
          style: AppTextStyle.f30w700bigFontColor,
        ),
        const Gap(AppSize.s24),
        Text(
          item.subTitle * 10,
          style: AppTextStyle.f18w500lightBlueGrey,
        ),
        const Gap(AppSize.s8),
      ],
    );
  }
}
