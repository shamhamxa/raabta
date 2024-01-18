import 'package:flutter/material.dart';
import 'package:raabta/screens/home.dart';
import 'package:raabta/screens/liscense_procedure.dart';
import 'package:raabta/screens/offense_list.dart';
import 'package:raabta/splash.dart';

class AppRouter {
  static const String splash = '/';
  static const String home = '/home';
  static const String offense = '/offense';
  static const String liscense = '/liscense';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => const Splash());

      case home:
        return MaterialPageRoute(builder: (context) => const Home());

      case offense:
        return MaterialPageRoute(builder: (context) => const OffenseList());

      case liscense:
        return MaterialPageRoute(
          builder: (context) => const LiscenseProcedure(),
        );
    }
    return null;
  }
}
