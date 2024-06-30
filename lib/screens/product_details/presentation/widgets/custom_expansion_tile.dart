import 'package:flutter/material.dart';
import 'package:ptc_quiz2/core/theme/app_color.dart';

import '../../../../core/theme/app_text_style.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: AppColor.transparent,
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: AppTextStyle.f16w600darkGrey,
        ),
        children: [
          Text(
            subTitle,
            style: AppTextStyle.f16w400darkGrey,
          )
        ],
      ),
    );
  }
}
