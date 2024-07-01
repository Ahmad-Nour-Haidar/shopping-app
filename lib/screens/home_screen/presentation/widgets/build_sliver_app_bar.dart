import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/utils/values_manager.dart';
import '../../models/dropdown_menu_entry_model.dart';
import 'custom_dropdown_menu.dart';
import 'custom_search_text_form_field.dart';

class BuildHomeSliverAppBar extends StatelessWidget {
  const BuildHomeSliverAppBar({super.key});

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
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: Column(
            children: [
              const Gap(AppSize.s16),
              const CustomSearchTextFormField(),
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
