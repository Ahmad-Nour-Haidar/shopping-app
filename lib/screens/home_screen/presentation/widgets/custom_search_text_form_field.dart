import 'package:flutter/material.dart';

import '../../../../core/assets/app_svg.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/values_manager.dart';
import '../../../../core/widgets/svg_image.dart';

class CustomSearchTextFormField extends StatelessWidget {
  const CustomSearchTextFormField({super.key});

  static final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: AppColor.primary, width: 2),
  );

  static final _errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: AppColor.red, width: 2),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Search Products or store',
        contentPadding: const EdgeInsets.all(AppPadding.p0),
        hintStyle: AppTextStyle.f14w500lightBlueGrey,
        prefixIcon: const SvgImage(
          path: AppSvg.search,
          size: AppSize.s18,
          color: AppColor.white,
        ),
        fillColor: AppColor.primary,
        filled: true,
        border: _border,
        disabledBorder: _border,
        enabledBorder: _border,
        focusedBorder: _border,
        focusedErrorBorder: _errorBorder,
        errorBorder: _errorBorder,
      ),
    );
  }
}