import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ptc_quiz2/core/theme/app_text_style.dart';

import '../../../../core/utils/values_manager.dart';
import '../../data/dummy_data.dart';
import 'recommended_widget.dart';

class BuildRecommendedList extends StatelessWidget {
  const BuildRecommendedList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.screenPadding),
          child: Text(
            'Recommended',
            style: AppTextStyle.f30w400darkGrey,
          ),
        ),
        SizedBox(
          height: AppSize.s225,
          child: ListView.separated(
            padding: const EdgeInsets.all(AppSize.screenPadding),
            scrollDirection: Axis.horizontal,
            itemCount: dealsOnFruitsAndTea.length,
            separatorBuilder: (_, __) => const Gap(AppSize.s12),
            itemBuilder: (_, index) {
              return RecommendedWidget(product: dealsOnFruitsAndTea[index]);
            },
          ),
        ),
      ],
    );
  }
}