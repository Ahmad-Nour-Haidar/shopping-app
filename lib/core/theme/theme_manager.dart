import 'package:flutter/material.dart';
import 'package:ptc_quiz2/core/assets/app_font.dart';
import 'package:ptc_quiz2/core/helper/color_helper.dart';

import 'app_color.dart';

abstract final class ThemeManager {
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
          centerTitle: true,
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
