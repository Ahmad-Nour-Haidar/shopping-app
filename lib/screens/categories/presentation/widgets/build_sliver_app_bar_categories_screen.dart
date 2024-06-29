import 'package:flutter/material.dart';
import 'package:ptc_quiz2/core/theme/app_text_style.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/utils/values_manager.dart';

class BuildCategoriesSliverAppBar extends StatelessWidget {
  const BuildCategoriesSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: AppColor.deepBlue,
      // pinned: true,
      floating: true,
      expandedHeight: AppSize.s160,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.symmetric(
          horizontal: AppSize.s20,
          vertical: AppSize.s10,
        ),
        background: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Shop\n',
                  style: AppTextStyle.f50w300bigFontColor,
                ),
                TextSpan(
                  text: 'By Category',
                  style: AppTextStyle.f50w800bigFontColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
