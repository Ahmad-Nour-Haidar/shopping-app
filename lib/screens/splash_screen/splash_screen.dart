import 'package:flutter/material.dart';
import 'package:ptc_quiz2/core/assets/app_svg.dart';
import 'package:ptc_quiz2/core/theme/app_color.dart';
import 'package:ptc_quiz2/core/theme/app_text_style.dart';
import 'package:ptc_quiz2/core/widgets/svg_image.dart';
import 'package:ptc_quiz2/screens/splash_screen/data/dummy_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/widgets/custom_button.dart';
import 'widgets/on_boarding_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.deepBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: pageViewItem.length,
                        itemBuilder: (_, index) {
                          final item = pageViewItem[index];
                          final isEnd = index == pageViewItem.length - 1;
                          return Padding(
                            /// also we should handel if 'ar' - 'en'
                            padding: EdgeInsets.only(right: isEnd ? 0 : 16),
                            child: OnBoardingWidget(
                              item: item,
                            ),
                          );
                        },
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: pageViewItem.length,
                      axisDirection: Axis.horizontal,
                      effect: const ExpandingDotsEffect(
                        spacing: 8.0,
                        radius: 5.0,
                        dotWidth: 32.0,
                        dotHeight: 5.0,
                        strokeWidth: 1.5,
                        dotColor: AppColor.grey,
                        activeDotColor: AppColor.white,
                        expansionFactor: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 2,
                child: Icon(
                  Icons.image_outlined,
                  color: AppColor.white,
                  size: 150,
                ),
              ),

              /// we can use [ElevatedButton.icon]
              CustomButton(
                size: const Size(250, 70),
                backgroundColor: AppColor.white,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Get started',
                      style: AppTextStyle.f16w600darkGrey,
                    ),
                    Transform.flip(
                      flipX: true,
                      child: const SvgImage(
                        path: AppSvg.arrowLeft,
                        size: 28,
                        color: AppColor.darkGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
