import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptc_quiz2/core/constant/app_keys.dart';
import 'package:ptc_quiz2/routers.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/values_manager.dart';
import '../../data/models/category_mode.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.model,
  });

  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(
        AppRouter.productsOfCategoryScreen,
        extra: {
          AppKeys.categoryId: model.id,
        },
      ),
      borderRadius: BorderRadius.circular(AppSize.s12),
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s12),
          color: AppColor.backgroundCategory.withAlpha(80),
        ),
        child: Column(
          children: [
            const Icon(
              Icons.image_outlined,
              size: AppSize.s55,
              color: AppColor.lightGrey,
            ),
            const Divider(
              endIndent: AppSize.s40,
              indent: AppSize.s40,
            ),
            Text(
              model.name,
              style: AppTextStyle.f13w600darkBlue,
            ),
            Text(
              model.description,
              style: AppTextStyle.f12w400darkBlue,
            ),
          ],
        ),
      ),
    );
  }
}
