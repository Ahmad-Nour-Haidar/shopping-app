final class CartManager {
  CartManager._();

  static CartManager? _instance;

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
  }

  void remove(String id) => _cartStore.remove(id);

  void removeAll() => _cartStore.clear();
}
