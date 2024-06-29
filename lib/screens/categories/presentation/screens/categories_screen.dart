import 'package:flutter/material.dart';

import '../../../../core/utils/values_manager.dart';
import '../../data/dummy_data.dart';
import '../widgets/build_sliver_app_bar_categories_screen.dart';
import '../widgets/category_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const BuildCategoriesSliverAppBar(),
        SliverPadding(
          padding: const EdgeInsets.all(AppPadding.screenPadding),
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
