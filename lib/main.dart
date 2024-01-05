import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raabta/controller/ui_controller.dart';
import 'package:raabta/routes/route.dart';
import 'package:raabta/theme/theme_provider.dart';

void main() {
  runApp(const RaabtaApp());
}

class RaabtaApp extends StatelessWidget {
  const RaabtaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UIcontroller(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: (settings) {
          return AppRouter.onGenerateRoute(settings);
        },
      ),
    );
  }
}
