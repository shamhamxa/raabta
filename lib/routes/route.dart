import 'package:flutter/material.dart';
import 'package:raabta/screens/home.dart';
import 'package:raabta/splash.dart';

class AppRouter {
  static const String splash = '/';
  static const String home = '/home';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => const Splash());

      case home:
        return MaterialPageRoute(builder: (context) => const Home());
    }
    return null;
  }
}
