import 'package:flutter/material.dart';
import 'package:ptc_quiz2/core/extensions/build_context_extensions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/utils/values_manager.dart';

class PageViewImages extends StatefulWidget {
  const PageViewImages({
    super.key,
    required this.imagesUrl,
  });

  final List<String> imagesUrl;

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
      height: context.height * .2,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: length,
              itemBuilder: (_, __) {
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
          SmoothPageIndicator(
            controller: _pageController,
            count: length,
            axisDirection: Axis.horizontal,
            effect: const ExpandingDotsEffect(
              spacing: 8.0,
              radius: 5.0,
              dotWidth: 32.0,
              dotHeight: 5.0,
              strokeWidth: 1.5,
              dotColor: AppColor.lightGrey,
              activeDotColor: AppColor.gold,
              expansionFactor: 1.1,
            ),
          )
        ],
      ),
    );
  }
}
