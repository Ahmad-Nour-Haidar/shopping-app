import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:gap/gap.dart';
import 'package:ptc_quiz2/core/assets/app_svg.dart';
import 'package:ptc_quiz2/core/theme/app_color.dart';
import 'package:ptc_quiz2/core/theme/app_text_style.dart';
import 'package:ptc_quiz2/core/widgets/svg_image.dart';
import 'package:badges/badges.dart';

import '../../../../core/models/pair_icons.dart';
import '../../../../core/utils/values_manager.dart';
import '../../../home_screen/presentation/screens/home_screen.dart';

class HomeNavScreen extends StatefulWidget {
  const HomeNavScreen({super.key});

  @override
  State<HomeNavScreen> createState() => _HomeNavScreenState();
}

class _HomeNavScreenState extends State<HomeNavScreen> {
  int _bottomNavIndex = 0;
  static const _icons = [
    PairIcons(
      filledIcon: Icons.home_filled,
      outlinedIcon: Icons.home_outlined,
    ),
    PairIcons(
      filledIcon: Icons.favorite,
      outlinedIcon: Icons.favorite_border,
    ),
    PairIcons(
      filledIcon: Icons.category,
      outlinedIcon: Icons.category_outlined,
    ),
    PairIcons(
      filledIcon: Icons.more_vert,
      outlinedIcon: Icons.more_vert_outlined,
    ),
  ];

  static const _screens = [
    HomeScreen(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
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
        items: List.generate(_icons.length, (index) {
          return Icon(
            _icons[index].getIcon(_bottomNavIndex == index),
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
          style: AppTextStyle.f22w600fontColor,
        ),
        actions: [
          Badge(
            badgeStyle: BadgeStyle(
              shape: BadgeShape.circle,
              badgeColor: AppColor.gold,
              borderRadius: BorderRadius.circular(AppSize.s10),
            ),
            badgeContent: const Text(
              '3',
              style: AppTextStyle.f14w600white,
            ),
            position: BadgePosition.custom(
              top: -AppSize.s15,
              end: -AppSize.s15,
            ),
            child: const SvgImage(
              path: AppSvg.cart,
              size: AppSize.s18,
              color: AppColor.white,
            ),
          ),
          const Gap(AppSize.s24),
        ],
      ),
      body: _screens[_bottomNavIndex],
    );
  }
}
