import 'dart:math';

import 'package:ptc_quiz2/core/helper/ID_helper.dart';

/// this is a simple order model
final class OrderItem {
  final String productId;
  final String productName;
  final int quantity;
  final double price;

  OrderItem({
    required this.productName,
    required this.quantity,
    required this.price,
  }) : productId = IDHelper.idV1;
}

final class OrderModel {
  final String orderId;
  final String customerName;
  final DateTime orderDate;
  final double totalAmount;
  final OrderModelStatus status;
  final List<OrderItem> items;

  OrderModel({
    required this.customerName,
    required this.totalAmount,
    required this.items,
  })  : orderId = IDHelper.idV1,
        orderDate = DateTime.now(),
        status = Random().nextBool()
            ? OrderModelStatus.success
            : OrderModelStatus.pending;

  double get totalPrice => items.fold(
        0,
        (sum, item) => sum + (item.price * item.quantity),
      );

  String get firstItemName => items[0].productName;
}

enum OrderModelStatus {
  success,
  pending;

  bool get isSuccess => this == success;
}
