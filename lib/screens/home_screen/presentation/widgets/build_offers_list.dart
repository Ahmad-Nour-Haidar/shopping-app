import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/values_manager.dart';
import 'offer_widget.dart';

class BuildOffersList extends StatelessWidget {
  const BuildOffersList({super.key});

  @override
  Widget build(BuildContext context) {
    final offers = <String>[
      'Get 50 % OFF on first 5 orders',
      'Get 30 % OFF on first 3 orders',
      'Get 10 % OFF on first 1 orders',
    ];
    return SizedBox(
      height: AppSize.s180,
      // width: 200,
      child: ListView.separated(
        padding: const EdgeInsets.all(AppPadding.screenPadding),
        scrollDirection: Axis.horizontal,
        itemCount: offers.length,
        separatorBuilder: (_, __) => const Gap(AppSize.s12),
        itemBuilder: (_, index) {
          return OfferWidget(label: offers[index]);
        },
      ),
    );
  }
}
