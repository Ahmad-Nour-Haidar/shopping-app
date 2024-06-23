import 'package:go_router/go_router.dart';
import 'package:ptc_quiz2/screens/splash_screen/splash_screen.dart';

// GoRouter configuration
abstract final class AppRouter {
  static const splashScreen = '/';

  static final router = GoRouter(
    initialLocation: splashScreen,
    routes: <GoRoute>[
      GoRoute(
        path: splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
    ],
  );
}
