import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/home_screen/home_screen.dart';
import 'screens/splash_screen/splash_screen.dart';

// GoRouter configuration
abstract final class AppRouter {
  static const splashScreen = '/';
  static const homeNavScreen = '/homeNavScreen';

  static final Map<String, Widget Function(BuildContext, GoRouterState)>
      _screens = {
    splashScreen: (context, state) => const SplashScreen(),
    homeNavScreen: (context, state) => const HomeNavScreen(),
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
