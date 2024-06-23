import 'package:flutter/material.dart' show FontWeight, TextStyle;

import 'app_color.dart';

abstract final class AppTextStyle {
  static const f30w700bigFontColor = TextStyle(
    color: AppColor.bigFontColor,
    fontSize: 30,
    fontWeight: FontWeight.w700,
  );

  static const f18w500lightBlueGrey = TextStyle(
    color: AppColor.lightBlueGrey,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const f22w600fontColor = TextStyle(
    color: AppColor.fontColor,
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static const f11w800fontColor = TextStyle(
    color: AppColor.fontColor,
    fontSize: 11,
    fontWeight: FontWeight.w800,
  );

  static const f16w600darkGrey = TextStyle(
    color: AppColor.darkGrey,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}
