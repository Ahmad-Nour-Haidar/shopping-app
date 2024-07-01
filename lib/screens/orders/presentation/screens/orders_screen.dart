import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/values_manager.dart';
import '../../../../core/widgets/custom_arrow_button.dart';
import '../../../../core/widgets/loading.dart';
import '../../data/dummy_data.dart';
import '../../data/model/order_model.dart';
import '../widgets/custom_tap.dart';
import '../widgets/order_widget.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final _orders = <OrderModel>[];
  final _ordersFiltered = <OrderModel>[];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initial();
    });
    super.initState();
  }

  bool _loading = false;
  OrderModelStatus _currentStatus = OrderModelStatus.pending;

  Future<void> _initial() async {
    setState(() => _loading = true);
    _orders.addAll(orders);
    _filter(_currentStatus);
    await Future.delayed(const Duration(seconds: 3));
    setState(() => _loading = false);
  }

  Future<void> _filter(OrderModelStatus status) async {
    _currentStatus = status;
    _ordersFiltered.clear();
    _ordersFiltered.addAll(_orders.where((e) => e.status == status));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomArrowButton(),
        title: const Text('Orders'),
      ),
      body: _loading
          ? const CustomLoading()
          : Column(
              children: [
                /// we can use [StatefulBuilder]
                CustomTap(
                  currentStatus: _currentStatus,
                  onTap: _filter,
                ),
                const Gap(16),

                /// and here, we can use [StatefulBuilder]
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(AppPadding.screenPadding),
                    itemCount: _ordersFiltered.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (_, index) {
                      return OrderWidget(model: _ordersFiltered[index]);
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
