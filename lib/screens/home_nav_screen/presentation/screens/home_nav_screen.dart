import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:gap/gap.dart';
import 'package:ptc_quiz2/core/assets/app_svg.dart';
import 'package:ptc_quiz2/core/data/cart/cart_manager.dart';
import 'package:ptc_quiz2/core/theme/app_color.dart';
import 'package:ptc_quiz2/core/theme/app_text_style.dart';
import 'package:ptc_quiz2/core/widgets/svg_image.dart';
import 'package:badges/badges.dart';

import '../../../../core/models/pair_icons.dart';
import '../../../../core/utils/values_manager.dart';
import '../../../../core/widgets/badge_cart_icon.dart';
import '../../../Categories/presentation/screens/categories_screen.dart';
import '../../../home_screen/presentation/screens/home_screen.dart';

class HomeNavScreen extends StatefulWidget {
  const HomeNavScreen({super.key});

  @override
  State<HomeNavScreen> createState() => _HomeNavScreenState();
}

class _HomeNavScreenState extends State<HomeNavScreen> {
  int _bottomNavIndex = 0;

  static const _screens = [
    ScreenWithPairIcons(
      pairIcons: PairIcons(
        filledIcon: Icons.home_filled,
        outlinedIcon: Icons.home_outlined,
      ),
      screen: HomeScreen(),
    ),
    ScreenWithPairIcons(
      pairIcons: PairIcons(
        filledIcon: Icons.category,
        outlinedIcon: Icons.category_outlined,
      ),
      screen: CategoriesScreen(),
    ),
    ScreenWithPairIcons(
      pairIcons: PairIcons(
        filledIcon: Icons.favorite,
        outlinedIcon: Icons.favorite_border,
      ),
      screen: SizedBox(),
    ),
    ScreenWithPairIcons(
      pairIcons: PairIcons(
        filledIcon: Icons.more_vert,
        outlinedIcon: Icons.more_vert_outlined,
      ),
      screen: SizedBox(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColor.transparent,
        color: AppColor.lightGrey.withAlpha(50),
        buttonBackgroundColor: AppColor.darkGrey,
        index: _bottomNavIndex,
        items: List.generate(_screens.length, (index) {
          return Icon(
            _screens[index].pairIcons.getIcon(_bottomNavIndex == index),
            size: AppSize.s30,
            color: _bottomNavIndex == index ? AppColor.gold : AppColor.darkGrey,
          );
        }),
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
      appBar: AppBar(
        backgroundColor: AppColor.deepBlue,
        title: const Text(
          'Hay, Ahmad',
          style: AppTextStyle.f20w500bigFontColor,
        ),
        actions: const [
          BadgeCartIcon(),
          Gap(AppSize.s24),
        ],
      ),
      body: _screens[_bottomNavIndex].screen,
    );
  }
}
