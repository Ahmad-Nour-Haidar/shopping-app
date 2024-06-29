import 'dart:math' show Random;

import 'package:ptc_quiz2/screens/Categories/data/dummy_data.dart';
import 'package:uuid/uuid.dart';

abstract final class IDHelper {
  static const _uuid = Uuid();
  static final _random = Random();

  static String get idV1 => _uuid.v1();

  static String get randomCategoryID =>
      categories[_random.nextInt(categories.length)].id;
}
