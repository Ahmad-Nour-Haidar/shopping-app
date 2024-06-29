import 'package:flutter/foundation.dart' show immutable;

@immutable
class ProductModel {
  final String id;
  final String categoryId;
  final String name;
  final String category;
  final double price;
  final double discount;
  final double rating;
  final String image;
  final int reviews;
  final String details;
  final String nutritionalFacts;

  const ProductModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    required this.discount,
    required this.rating,
    required this.reviews,
    required this.details,
    required this.nutritionalFacts,
  });

  double get priceAfterDiscount => price - (discount * price / 100);
}
