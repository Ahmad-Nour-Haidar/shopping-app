import 'package:flutter/foundation.dart' show immutable;

@immutable
class Product {
  final String name;
  final String category;
  final double price;
  final String image;

  const Product(
      {required this.name,
      required this.category,
      required this.price,
      required this.image});
}

