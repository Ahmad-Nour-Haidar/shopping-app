import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ptc_quiz2/core/assets/app_svg.dart';
import 'package:ptc_quiz2/core/theme/app_color.dart';
import 'package:ptc_quiz2/core/theme/app_text_style.dart';
import 'package:ptc_quiz2/core/widgets/svg_image.dart';
import 'package:badges/badges.dart' as badges;
import 'package:ptc_quiz2/screens/home_screen/widgets/build_offers_list.dart';

import '../../core/models/pair_icons.dart';
import 'widgets/build_deals_list.dart';
import 'widgets/build_recommended_list.dart';
import 'widgets/build_sliver_app_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    ;
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
            size: 30,
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
          badges.Badge(
            badgeStyle: badges.BadgeStyle(
              shape: badges.BadgeShape.circle,
              badgeColor: AppColor.gold,
              borderRadius: BorderRadius.circular(10.0),
            ),
            badgeContent: const Text(
              '3',
              style: AppTextStyle.f14w600white,
            ),
            position: badges.BadgePosition.custom(top: -15.0, end: -15),
            child: const SvgImage(
              path: AppSvg.cart,
              size: 18,
              color: AppColor.white,
            ),
          ),
          const Gap(24),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          buildSliverAppBar(),
          const SliverToBoxAdapter(
            child: BuildOffersList(),
          ),
          const SliverToBoxAdapter(
            child: BuildRecommendedList(),
          ),
          const SliverToBoxAdapter(
            child: BuildDealsList(),
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     childCount: 50,
          //     (context, index) {
          //       return ListTile(
          //         title: Text(index.toString()),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
