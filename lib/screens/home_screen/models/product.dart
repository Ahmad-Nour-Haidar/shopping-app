import 'package:flutter/foundation.dart' show immutable;

@immutable
class Product {
  final String id;
  final String categoryId;
  final String name;
  final String category;
  final double price;
  final String image;

  const Product({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.category,
    required this.price,
    required this.image,
  });
}
