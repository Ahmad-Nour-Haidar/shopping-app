import 'package:flutter/material.dart';
import 'package:ptc_quiz2/core/assets/app_font.dart';
import 'package:ptc_quiz2/core/helper/color_helper.dart';

import 'app_color.dart';
import 'app_text_style.dart';

abstract final class ThemeManager {
  static const _border = UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColor.grey,
    ),
  );

  static const _errorBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColor.red,
    ),
  );

  static ThemeData get light => ThemeData(
      useMaterial3: true,
      fontFamily: AppFont.manrope,
      primaryColor: AppColor.primary,
      primarySwatch: ColorHelper.toMaterialColor(AppColor.primary),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColor.primary,
      ),
      applyElevationOverlayColor: false,
      appBarTheme: const AppBarTheme(
        scrolledUnderElevation: 0.0,
        titleTextStyle: AppTextStyle.f16w600darkGrey,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: AppColor.transparent,
        filled: true,
        border: _border,
        disabledBorder: _border,
        enabledBorder: _border,
        focusedBorder: _border,
        focusedErrorBorder: _errorBorder,
        errorBorder: _errorBorder,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: AppColor.primary,
          foregroundColor: AppColor.white,
          // padding: const EdgeInsets.all(0),
          elevation: 0.0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(width: 10)),
          elevation: 0.0,
        ),
      ));
}
