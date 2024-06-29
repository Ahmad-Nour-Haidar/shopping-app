import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptc_quiz2/core/constant/app_keys.dart';
import 'package:ptc_quiz2/core/extensions/build_context_extensions.dart';
import 'package:ptc_quiz2/core/utils/values_manager.dart';
import 'package:ptc_quiz2/screens/home_screen/data/dummy_data.dart';
import 'package:ptc_quiz2/screens/home_screen/models/product.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/loading.dart';

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
          : ListView(
              padding: const EdgeInsets.all(AppPadding.screenPadding),
              children: const [
                PageViewImages(),
              ],
            ),
    );
  }
}

class PageViewImages extends StatefulWidget {
  const PageViewImages({super.key});

  @override
  State<PageViewImages> createState() => _PageViewImagesState();
}

class _PageViewImagesState extends State<PageViewImages> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const length = 3;
    return SizedBox(
      height: context.height / 3,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: 3,
              itemBuilder: (_, index) {
                return const Align(
                  child: Icon(
                    Icons.image_outlined,
                    size: AppSize.s55,
                    color: AppColor.lightGrey,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
