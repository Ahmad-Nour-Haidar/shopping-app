import 'package:flutter/material.dart';

import '../../../screens/home_screen/data/dummy_data.dart';

final class CartManager {
  CartManager._() {
    _cartCountController = ValueNotifier(_cartStore.length);
    _cartPriceCartDetails = ValueNotifier(
      PriceCartDetails(subTotal: 0, delivery: 0, total: 0),
    );
  }

  static CartManager? _instance;

  late final ValueNotifier<int> _cartCountController;

  ValueNotifier<int> get cartCountController => _cartCountController;

  late final ValueNotifier<PriceCartDetails> _cartPriceCartDetails;

  ValueNotifier<PriceCartDetails> get cartPriceCartDetails =>
      _cartPriceCartDetails;

  int get countProduct => _cartStore.length;

  List<String> get ids => _cartStore.keys.toList();

  factory CartManager() {
    _instance ??= CartManager._();
    return _instance!;
  }

  /// storing id of each item and the amount
  /// we should to use a storage package like [Hive]
  final _cartStore = <String, int>{};

  int getAmount(String id) => _cartStore[id] ?? 0;

  void store(String id, int amount) {
    if (amount == 0) {
      _cartStore.remove(id);
    } else if (amount > 0) {
      _cartStore[id] = amount;
    } else {
      throw ArgumentError('Amount should be greater than or equal 0.');
    }

    /// rebuild only when needed
    if (_cartCountController.value != countProduct) {
      _cartCountController.value = countProduct;
    }
    calcPrice();
  }

  void remove(String id) {
    _cartStore.remove(id);
    calcPrice();
  }

  void removeAll() {
    _cartStore.clear();
    calcPrice();
  }

  void calcPrice() {
    double subTotal = 0, delivery = 0, total = 0;
    for (final id in _cartStore.keys) {
      final product = products.firstWhere((element) => element.id == id);
      subTotal += (product.priceAfterDiscount * getAmount(product.id));
    }
    delivery = subTotal * .05; // 5 % of subTotalPrice
    total = subTotal + delivery;
    _cartPriceCartDetails.value = PriceCartDetails(
      subTotal: subTotal,
      delivery: delivery,
      total: total,
    );
  }
}

final class PriceCartDetails {
  final double subTotal;
  final double delivery;
  final double total;

  PriceCartDetails({
    required this.subTotal,
    required this.delivery,
    required this.total,
  });
}
