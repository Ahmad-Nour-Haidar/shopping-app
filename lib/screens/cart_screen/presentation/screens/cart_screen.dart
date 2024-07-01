import 'package:flutter/material.dart';

import '../../../../core/data/cart/cart_manager.dart';
import '../../../home_screen/data/dummy_data.dart';
import '../../../home_screen/models/product.dart';
import '../widgets/cart_sliver_app_bar.dart';
import '../widgets/cart_widget.dart';
import '../widgets/price_details_cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _cartProducts = <ProductModel>[];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initial();
    });
    super.initState();
  }

  Future<void> _initial() async {
    final ids = CartManager().ids;
    _cartProducts.clear();
    for (final id in ids) {
      final product = products.firstWhere((element) => element.id == id);
      _cartProducts.add(product);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                CartSliverAppBar(
                  productCount: CartManager().countProduct,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: _cartProducts.length,
                    (context, index) {
                      return CartWidget(
                        model: _cartProducts[index],
                        onProductRemoved: (id) {
                          setState(() {
                            _cartProducts.removeWhere((e) => e.id == id);
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const PriceDetailsCart(
            buttonTitle: 'Proceed  To checkout',
          ),
        ],
      ),
    );
  }
}
