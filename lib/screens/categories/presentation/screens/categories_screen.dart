import 'package:flutter/material.dart';
import 'package:ptc_quiz2/core/theme/app_text_style.dart';
import 'package:ptc_quiz2/core/utils/values_manager.dart';
import 'package:ptc_quiz2/screens/Categories/data/dummy_data.dart';
import 'package:ptc_quiz2/screens/Categories/data/models/category_mode.dart';

import '../../../../core/theme/app_color.dart';
import '../widgets/build_sliver_app_bar_categories_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const BuildCategoriesSliverAppBar(),
        SliverPadding(
          padding: const EdgeInsets.all(AppSize.screenPadding),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: AppSize.s20,
              crossAxisSpacing: AppSize.s20,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: categories.length,
              (context, index) {
                return CategoryWidget(
                  model: categories[index],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.model,
  });

  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
