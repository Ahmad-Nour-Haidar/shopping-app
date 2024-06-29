import 'package:flutter/material.dart';
import 'package:ptc_quiz2/core/assets/app_font.dart';
import 'package:ptc_quiz2/core/helper/color_helper.dart';

import 'app_color.dart';
import 'app_text_style.dart';

abstract final class ThemeManager {
  static final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: AppColor.primary, width: 2),
  );

  static final _errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: AppColor.red, width: 2),
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
          titleTextStyle: AppTextStyle.f16w600darkGrey,
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: AppColor.primary,
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
      );
}
