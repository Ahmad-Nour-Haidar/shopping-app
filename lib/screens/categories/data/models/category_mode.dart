import 'package:flutter/foundation.dart' show immutable;

@immutable
final class CategoryModel {
  final String id;
  final String name;
  final String description;
  final String image;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });
}
