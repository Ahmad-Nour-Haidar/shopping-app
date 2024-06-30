import 'package:flutter/foundation.dart' show immutable;

import '../../../../core/helper/ID_helper.dart';

@immutable
final class CategoryModel {
  final String id;
  final String name;
  final String description;
  final String image;

  CategoryModel({
    required this.name,
    required this.description,
    required this.image,
  }) : id = IDHelper.idV1;
}
