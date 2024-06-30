import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ptc_quiz2/core/assets/app_svg.dart';
import 'package:ptc_quiz2/core/data/cart/cart_manager.dart';
import 'package:ptc_quiz2/core/extensions/build_context_extensions.dart';
import 'package:ptc_quiz2/core/theme/app_color.dart';
import 'package:ptc_quiz2/core/theme/app_text_style.dart';
import 'package:ptc_quiz2/core/utils/values_manager.dart';
import 'package:ptc_quiz2/core/widgets/custom_svg_icon_button.dart';
import 'package:ptc_quiz2/screens/address_card/data/dummy_data.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../data/models/address_model.dart';

class AddressCardScreen extends StatefulWidget {
  const AddressCardScreen({super.key});

  @override
  State<AddressCardScreen> createState() => _AddressCardScreenState();
}

class _AddressCardScreenState extends State<AddressCardScreen> {
  final _addresses = <AddressModel>[];
  String _selectedId = '';

  @override
  void initState() {
    _addresses.addAll(addresses);
    super.initState();
  }

  Future<void> _refresh() async {
    // there is a lot of logic ...!
    setState(() {
      _selectedId = '';
      _addresses.clear();
      _addresses.addAll(addresses);
    });
  }

  @override
  Widget build(BuildContext context) {
    /// we can refactor code
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping Cart (${CartManager().countProduct})',
        ),
        actions: [
          CustomIconButton(
            path: AppSvg.circleAdd,
            color: AppColor.gold,
            onTap: () {
              // todo
              // new address screen
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Delivery Address',
              style: AppTextStyle.f16w600deepBlue,
            ),
            const Gap(12),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refresh,
                child: ListView.separated(
                  itemCount: _addresses.length,
                  separatorBuilder: (_, __) => const Gap(AppSize.s12),
                  itemBuilder: (_, index) {
                    final item = _addresses[index];
                    final isSelected = item.id == _selectedId;
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p12,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s12),
                        border: Border.all(
                          width: 3,
                          color: isSelected
                              ? AppColor.gold
                              : AppColor.lightBlueGrey,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item.title,
                                style: AppTextStyle.f16w600darkGrey,
                              ),
                              Checkbox(
                                value: isSelected,
                                checkColor: AppColor.black,
                                activeColor: AppColor.gold,
                                shape: const CircleBorder(),
                                onChanged: (value) {
                                  setState(() {
                                    if (_selectedId == item.id) {
                                      // un select
                                      _selectedId = '';
                                    } else {
                                      _selectedId = item.id;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item.street,
                                style: AppTextStyle.f16w400darkGrey,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Edit'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const Gap(16),
            Align(
              child: CustomButton(
                onPressed: () {},
                size: Size(context.width * .8, 56),
                child: const Text(
                  'Add Card',
                  style: AppTextStyle.f16w600white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
