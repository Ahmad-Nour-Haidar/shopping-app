import 'package:go_router/go_router.dart';

import 'screens/home_screen/home_screen.dart';
import 'screens/splash_screen/splash_screen.dart';

// GoRouter configuration
abstract final class AppRouter {
  static const splashScreen = '/';
  static const homeScreen = '/homeScreen';

  static final router = GoRouter(
    initialLocation: splashScreen,
    routes: <GoRoute>[
      GoRoute(
        path: splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
