import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ptc_quiz2/core/theme/app_text_style.dart';

import '../../../../core/utils/values_manager.dart';
import '../../data/dummy_data.dart';
import 'deal_widget.dart';

class BuildDealsList extends StatelessWidget {
  const BuildDealsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.screenPadding),
          child: Text(
            'Deals on Fruits & Tea',
            style: AppTextStyle.f20w700darkGrey,
          ),
        ),
        SizedBox(
          height: AppSize.s250,
          child: ListView.separated(
            padding: const EdgeInsets.all(AppPadding.screenPadding),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (_, __) => const Gap(AppSize.s12),
            itemBuilder: (_, index) {
              return ProductWidget(product: products[index]);
            },
          ),
        ),
      ],
    );
  }
}
