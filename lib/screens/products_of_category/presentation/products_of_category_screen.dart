import 'package:flutter/material.dart';
import 'package:ptc_quiz2/core/constant/app_keys.dart';
import 'package:ptc_quiz2/core/extensions/build_context_extensions.dart';
import 'package:ptc_quiz2/core/theme/app_text_style.dart';
import 'package:ptc_quiz2/core/utils/values_manager.dart';
import 'package:ptc_quiz2/screens/Categories/data/dummy_data.dart';
import 'package:ptc_quiz2/screens/Categories/data/models/category_mode.dart';
import 'package:ptc_quiz2/screens/home_screen/models/product.dart';
import 'package:ptc_quiz2/screens/home_screen/presentation/widgets/deal_widget.dart';

import '../../../core/widgets/custom_arrow_button.dart';
import '../../../core/widgets/loading.dart';
import '../../home_screen/data/dummy_data.dart';

/// I always use [Cubit], but this is only for the quiz
class ProductsOfCategoryScreen extends StatefulWidget {
  const ProductsOfCategoryScreen({super.key});

  @override
  State<ProductsOfCategoryScreen> createState() =>
      _ProductsOfCategoryScreenState();
}

class _ProductsOfCategoryScreenState extends State<ProductsOfCategoryScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initial();
    });
    super.initState();
  }

  CategoryModel? _category;
  final _data = <ProductModel>[];
  bool _isLoading = false;

  Future<void> _initial() async {
    setState(() => _isLoading = true);
    final extra = context.extra as Map;
    final categoryId = extra[AppKeys.categoryId];
    _category = categories.where((element) => element.id == categoryId).first;
    _data.addAll(products.where((element) => element.categoryId == categoryId));
    await Future.delayed(const Duration(seconds: 3));
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomArrowButton(),
        title: Text(
          _category?.name ?? '',
          style: AppTextStyle.f16w600darkGrey,
        ),
      ),
      body: _isLoading
          ? const CustomLoading()
          : GridView.builder(
              padding: const EdgeInsets.all(AppPadding.screenPadding),
              itemCount: _data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: AppSize.s20,
                mainAxisSpacing: AppSize.s20,
                childAspectRatio: 1 / 1.3,
              ),
              itemBuilder: (_, index) {
                return ProductWidget(product: _data[index]);
              },
            ),
    );
  }
}
