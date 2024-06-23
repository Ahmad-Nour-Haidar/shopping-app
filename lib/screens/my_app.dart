import 'package:flutter/material.dart';
import 'package:ptc_quiz2/core/theme/theme_manager.dart';
import 'package:ptc_quiz2/routers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Shopping',
      routerConfig: AppRouter.router,
      theme: ThemeManager.light,
    );
  }
}
