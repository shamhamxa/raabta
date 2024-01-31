import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:raabta/controller/ui_controller.dart';
import 'package:raabta/routes/route.dart';
import 'package:raabta/theme/theme_provider.dart';
import 'package:raabta/utils/app_color.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const RaabtaApp(),
    ),
  );
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
        child: Consumer<ThemeProvider>(
          builder: (context, theme, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: Brightness.light,
                colorScheme: const ColorScheme.light(
                  background: AppColor.white,
                  primary: Color(0xff2382a1),
                  secondary: Color.fromARGB(255, 177, 208, 218),
                ),
                textTheme:
                    GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
                // Other theme properties can be customized here if needed
              ),
              // theme: theme.theme.copyWith(
              //   // Use Google Fonts for the entire app text theme
              //   textTheme: theme.textThemeWithGoogleFonts,
              //   // You can customize other theme properties here if needed
              // ),
              // theme: ThemeData(

              //   // textTheme:
              //   //     GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
              // ),
              onGenerateRoute: (settings) {
                return AppRouter.onGenerateRoute(settings);
              },
            );
          },
        ));
  }
}
