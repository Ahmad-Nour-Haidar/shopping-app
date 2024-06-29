import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/assets/app_svg.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/values_manager.dart';
import '../../../../core/widgets/svg_image.dart';
import '../../models/dropdown_menu_entry_model.dart';
import 'custom_dropdown_menu.dart';

class BuildSliverAppBar extends StatelessWidget {
  const BuildSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final list = <DropdownMenuEntryModel>[
      const DropdownMenuEntryModel(value: '', label: 'Green Way 1000, Sylhet'),
      const DropdownMenuEntryModel(value: '', label: 'Green Way 3000, Sylhet'),
      const DropdownMenuEntryModel(value: '', label: 'Green Way 5000, Sylhet'),
      const DropdownMenuEntryModel(value: '', label: 'Green Way 7000, Sylhet'),
      const DropdownMenuEntryModel(value: '', label: 'Green Way 9000, Sylhet'),
    ];
    final listTime = <DropdownMenuEntryModel>[
      const DropdownMenuEntryModel(value: '', label: '1 Hour'),
      const DropdownMenuEntryModel(value: '', label: '2 Hour'),
      const DropdownMenuEntryModel(value: '', label: '3 Hour'),
      const DropdownMenuEntryModel(value: '', label: '4 Hour'),
    ];

    return SliverAppBar(
      backgroundColor: AppColor.deepBlue,
      // pinned: true,
      floating: true,
      expandedHeight: AppSize.s160,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(
          horizontal: AppSize.s20,
          vertical: AppSize.s10,
        ),
        background: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
          child: Column(
            children: [
              const Gap(AppSize.s16),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Search Products or store',
                  contentPadding: EdgeInsets.all(AppPadding.p0),
                  hintStyle: AppTextStyle.f14w500lightBlueGrey,
                  prefixIcon: SvgImage(
                    path: AppSvg.search,
                    size: AppSize.s18,
                    color: AppColor.white,
                  ),
                ),
              ),
              const Gap(AppSize.s16),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CustomDropdownMenu(
                      currentValue: 'Green Way 1000, Sylhet',
                      title: 'Delivery to',
                      items: list,
                      onChange: (value) {},
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: CustomDropdownMenu(
                      currentValue: '1 Hour',
                      title: 'Within',
                      items: listTime,
                      onChange: (value) {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
