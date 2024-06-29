import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ptc_quiz2/core/extensions/build_context_extensions.dart';
import 'package:ptc_quiz2/core/theme/app_text_style.dart';

import '../../../../core/constant/app_keys.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/utils/values_manager.dart';
import '../../../../core/widgets/loading.dart';
import '../../../home_screen/data/dummy_data.dart';
import '../../../home_screen/models/product.dart';
import '../widgets/details_product.dart';
import '../widgets/page_view_images.dart';
import '../widgets/price_product_details.dart';
import '../widgets/rating_reviews_bar_product.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ProductModel? _product;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initial();
    });
    super.initState();
  }

  Future<void> _initial() async {
    final extra = context.extra as Map;
    final productId = extra[AppKeys.productId];
    _product = products.firstWhere((element) => element.id == productId);
    await Future.delayed(const Duration(seconds: 3));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_product?.name ?? ''),
      ),
      body: _product == null
          ? const CustomLoading()
          : Column(
              children: [
                const PageViewImages(imagesUrl: []),
                const Gap(16),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.lightBlueGrey.withAlpha(50),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(AppSize.s30),
                        topRight: Radius.circular(AppSize.s30),
                      ),
                    ),
                    child: ListView(
                      padding: const EdgeInsets.all(
                        AppPadding.screenPadding,
                      ),
                      physics: const BouncingScrollPhysics(),
                      children: [
                        const Text(
                          'Thin Choice Top Orange',
                          style: AppTextStyle.f20w600black,
                        ),
                        PriceProductDetails(product: _product!),
                        RatingReviewsBarProduct(product: _product!),
                        DetailsProduct(product: _product!),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
