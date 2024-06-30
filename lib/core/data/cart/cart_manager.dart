import 'package:flutter/material.dart';

final class CartManager {
  CartManager._() {
    _cartCountController = ValueNotifier(_cartStore.length);
  }

  static CartManager? _instance;

  late final ValueNotifier<int> _cartCountController;

  ValueNotifier<int> get cartCountController => _cartCountController;

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
    if (_cartCountController.value != _cartStore.length) {
      _cartCountController.value = _cartStore.length;
    }
  }

  void remove(String id) => _cartStore.remove(id);

  void removeAll() => _cartStore.clear();
}
