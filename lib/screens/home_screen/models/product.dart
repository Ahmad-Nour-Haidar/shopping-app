import 'package:flutter/foundation.dart' show immutable;
import 'package:ptc_quiz2/core/helper/ID_helper.dart';

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
  final int countReviews;
  final String reviews;
  final String details;
  final String nutritionalFacts;

  ProductModel({
    required this.categoryId,
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    required this.discount,
    required this.rating,
    required this.reviews,
    required this.countReviews,
    required this.details,
    required this.nutritionalFacts,
  }) : id = IDHelper.idV1;

  double get priceAfterDiscount => price - (discount * price / 100);
}
