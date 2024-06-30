import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ptc_quiz2/core/extensions/build_context_extensions.dart';

import '../../../../core/constant/app_keys.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/values_manager.dart';
import '../../../../core/widgets/badge_cart_icon.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/loading.dart';
import '../../../home_screen/data/dummy_data.dart';
import '../../../home_screen/models/product.dart';
import '../widgets/custom_expansion_tile.dart';
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
        actions: const [
          BadgeCartIcon(
            cartIconColor: AppColor.black,
          ),
          Gap(32),
        ],
      ),
      body: _product == null
          ? const CustomLoading()
          : Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        scrolledUnderElevation: 0.0,
                        expandedHeight: context.height * .2,
                        flexibleSpace: const FlexibleSpaceBar(
                          titlePadding: EdgeInsets.symmetric(
                            horizontal: AppSize.s20,
                            vertical: AppSize.s10,
                          ),
                          background: PageViewImages(imagesUrl: []),
                        ),
                      ),
                      const SliverToBoxAdapter(
                        child: Gap(32),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Container(
                              padding: const EdgeInsets.all(AppPadding.p16),
                              decoration: BoxDecoration(
                                color: AppColor.lightBlueGrey.withAlpha(50),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(AppSize.s30),
                                  topRight: Radius.circular(AppSize.s30),
                                ),
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    'Thin Choice Top Orange',
                                    style: AppTextStyle.f20w600black,
                                  ),
                                  PriceProductDetails(product: _product!),
                                  RatingReviewsBarProduct(product: _product!),
                                  DetailsProduct(product: _product!),
                                  CustomExpansionTile(
                                    title: 'Nutritional facts',
                                    subTitle: _product!.nutritionalFacts,
                                  ),
                                  CustomExpansionTile(
                                    title: 'Reviews',
                                    subTitle: _product!.reviews,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(AppPadding.p16),
                  color: AppColor.lightBlueGrey.withAlpha(50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        size: Size(context.width * .45, 56),
                        onPressed: () {},
                        child: const Text('Add To Cart'),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          minimumSize: Size(context.width * .45, 56),
                          maximumSize: Size(context.width * .45, 56),
                        ),
                        onPressed: () {},
                        child: const Text('Buy Now'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
