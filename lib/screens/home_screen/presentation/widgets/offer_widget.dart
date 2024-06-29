import 'package:flutter/material.dart';
import 'package:ptc_quiz2/core/utils/values_manager.dart';

import '../../../../core/helper/color_helper.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_style.dart';

class OfferWidget extends StatelessWidget {
  const OfferWidget({
    super.key,
    required this.label,
  });

  final String label;
  static final _pattern = RegExp(r'\d{1,2} % \s*OFF');

  List<String> get texts {
    final list = label.split(_pattern);
    final match = _pattern.allMatches(label).first.group(0) ?? '';
    list.insert(1, match);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final data = texts;
    return Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      decoration: BoxDecoration(
        color: ColorHelper.randomColor(),
        borderRadius: BorderRadius.circular(AppSize.s16),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.image_outlined,
            color: AppColor.white,
            size: AppSize.s60,
          ),
          Text.rich(
            TextSpan(
              children: [
                if (data.isNotEmpty)
                  TextSpan(
                    text: data[0],
                    style: AppTextStyle.f20w500bigFontColor,
                  ),
                if (data.length >= 2)
                  TextSpan(
                    text: '\n${data[1]}',
                    style: AppTextStyle.f30w700bigFontColor,
                  ),
                if (data.length >= 3)
                  TextSpan(
                    text: '\n${data[2]}',
                    style: AppTextStyle.f20w500bigFontColor,
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
