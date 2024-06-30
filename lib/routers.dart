import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/address_card/presentation/screens/address_card_screen.dart';
import 'screens/cart_screen/presentation/screens/cart_screen.dart';
import 'screens/home_nav_screen/presentation/screens/home_nav_screen.dart';
import 'screens/product_details/presentation/screens/product_details_screen.dart';
import 'screens/products_of_category/presentation/products_of_category_screen.dart';
import 'screens/splash_screen/presentation/screens/splash_screen.dart';

// GoRouter configuration
abstract final class AppRouter {
  static const splashScreen = '/';
  static const homeNavScreen = '/homeNavScreen';
  static const productsOfCategoryScreen = '/productsOfCategoryScreen';
  static const productDetailsScreen = '/productDetailsScreen';
  static const cartScreen = '/cartScreen';
  static const addressCardScreen = '/addressCardScreen';

  static final Map<String, Widget Function(BuildContext, GoRouterState)>
      _screens = {
    splashScreen: (context, state) => const SplashScreen(),
    homeNavScreen: (_, __) => const HomeNavScreen(),
    productsOfCategoryScreen: (_, __) => const ProductsOfCategoryScreen(),
    productDetailsScreen: (_, __) => const ProductDetailsScreen(),
    cartScreen: (_, __) => const CartScreen(),
    addressCardScreen: (_, __) => const AddressCardScreen(),
  };

  static final router = GoRouter(
    initialLocation: splashScreen,
    routes: _screens.entries.map((entry) {
      return GoRoute(
        path: entry.key,
        name: entry.key,
        builder: (context, state) {
          return entry.value(context, state);
        },
      );
    }).toList(),
  );
}
