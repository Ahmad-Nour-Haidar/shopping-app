import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constant/app_size.dart';
import 'offer_widget.dart';

SliverToBoxAdapter buildOffersList() {
  final offers = <String>[
    'Get 50 % OFF on first 5 orders',
    'Get 30 % OFF on first 3 orders',
    'Get 10 % OFF on first 1 orders',
  ];
  return SliverToBoxAdapter(
    child: SizedBox(
      height: 180,
      // width: 200,
      child: ListView.separated(
        padding: const EdgeInsets.all(AppSize.screenPadding),
        scrollDirection: Axis.horizontal,
        itemCount: offers.length,
        separatorBuilder: (_, __) => const Gap(12),
        itemBuilder: (_, index) {
          return OfferWidget(label: offers[index]);
        },
      ),
    ),
  );
}
