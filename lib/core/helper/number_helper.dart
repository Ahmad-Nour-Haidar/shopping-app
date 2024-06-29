import 'dart:math' show Random, max;

import 'package:flutter/material.dart';
import 'package:ptc_quiz2/core/extensions/build_context_extensions.dart';

abstract final class NumberHelper {
  static final _random = Random();

  static (int min, int max) _fixMinMax(int min, int max) =>
      (max < min) ? (max, min) : (min, max);

  static num randomWidthScreen(BuildContext context, [int min = 75]) {
    final num x = _random.nextInt(context.width.toInt());
    return max(x, min);
  }

  static num randomHeight([int min = 100, int max = 300]) {
    (min, max) = _fixMinMax(min, max);
    final num x = _random.nextInt(max - min) + min;
    return x;
  }

  static int randomInt([int min = 5, int max = 1000]) {
    (min, max) = _fixMinMax(min, max);
    return _random.nextInt(max - min) + min;
  }

  static int delay(int index) => (index % 10) * 75;
}
