import 'package:flutter/material.dart';

import '../widgets/build_deals_list.dart';
import '../widgets/build_offers_list.dart';
import '../widgets/build_recommended_list.dart';
import '../widgets/build_sliver_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: <Widget>[
        BuildSliverAppBar(),
        SliverToBoxAdapter(
          child: BuildOffersList(),
        ),
        SliverToBoxAdapter(
          child: BuildRecommendedList(),
        ),
        SliverToBoxAdapter(
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
    );
  }
}
