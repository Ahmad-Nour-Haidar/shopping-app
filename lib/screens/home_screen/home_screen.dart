import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ptc_quiz2/core/assets/app_svg.dart';
import 'package:ptc_quiz2/core/theme/app_color.dart';
import 'package:ptc_quiz2/core/theme/app_text_style.dart';
import 'package:ptc_quiz2/core/widgets/svg_image.dart';
import 'package:badges/badges.dart' as badges;
import 'package:ptc_quiz2/screens/home_screen/widgets/build_offers_list.dart';

import 'widgets/build_sliver_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          buildOffersList(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 50,
              (context, index) {
                return ListTile(
                  title: Text(index.toString()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
