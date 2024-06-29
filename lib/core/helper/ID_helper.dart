import 'package:ptc_quiz2/core/helper/number_helper.dart';
import 'package:ptc_quiz2/screens/Categories/data/dummy_data.dart';
import 'package:uuid/uuid.dart';

abstract final class IDHelper {
  static const _uuid = Uuid();

  static String get idV1 => _uuid.v1();

  static String get randomCategoryID {
    final index = NumberHelper.randomInt(0, categories.length);
    return categories[index].id;
  }
}
