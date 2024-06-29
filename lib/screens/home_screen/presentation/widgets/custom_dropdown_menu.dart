import 'package:flutter/material.dart';
import 'package:ptc_quiz2/core/extensions/build_context_extensions.dart';
import 'dart:math' show pi;
import '../../../../core/assets/app_svg.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/values_manager.dart';
import '../../../../core/widgets/svg_image.dart';
import '../../models/dropdown_menu_entry_model.dart';

class CustomDropdownMenu<T> extends StatelessWidget {
  const CustomDropdownMenu({
    super.key,
    required this.title,
    required this.items,
    required this.onChange,
    this.hint,
    this.currentValue,
  });

  final String? hint;
  final String title;
  final T? currentValue;
  final ValueChanged<T> onChange;
  final List<DropdownMenuEntryModel<T>> items;

  @override
  Widget build(BuildContext context) {
    TextEditingController? controller;
    if (currentValue != null) {
      controller = TextEditingController(text: currentValue.toString());
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.f14w500lightBlueGrey,
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            return Theme(
              data: context.theme.copyWith(
                primaryColor: AppColor.primary,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: AppColor.primary,
                  onSurface: AppColor.white,
                  surface: AppColor.white,
                ),
                inputDecorationTheme: const InputDecorationTheme(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                  // contentPadding: EdgeInsets.symmetric(
                  //   horizontal: 0,
                  //   vertical: 0,
                  // ),
                ),
              ),
              child: DropdownMenu(
                enableFilter: false,
                enableSearch: false,
                requestFocusOnTap: false,
                controller: controller,
                initialSelection: currentValue,
                hintText: hint,
                // menuHeight: 250,
                width: constraints.maxWidth,
                textStyle: AppTextStyle.f14w600white,
                trailingIcon: Transform.rotate(
                  angle: -pi / 2,
                  child: const SvgImage(
                    path: AppSvg.arrowLeft,
                    size: AppSize.s22,
                    color: AppColor.lightBlueGrey,
                  ),
                ),
                selectedTrailingIcon: Transform.rotate(
                  angle: pi / 2,
                  child: const SvgImage(
                    path: AppSvg.arrowLeft,
                    size: AppSize.s22,
                    color: AppColor.lightBlueGrey,
                  ),
                ),
                onSelected: (value) {
                  if (value == null) return;
                  FocusManager.instance.primaryFocus?.unfocus();
                  onChange(value);
                },
                dropdownMenuEntries: List.generate(
                  items.length,
                  (index) {
                    final item = items[index];
                    return DropdownMenuEntry(
                      value: item.value,
                      label: item.label,
                      labelWidget: Text(
                        item.label,
                        style: AppTextStyle.f14w500lightBlueGrey.copyWith(
                          color: AppColor.primary,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
