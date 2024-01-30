import 'package:flutter/material.dart';
import 'package:raabta/utils/app_color.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: AppColor.white,
    primary: Color.fromARGB(255, 40, 148, 184),
    secondary: AppColor.white,
  ),
);
// ThemeData darkMode = ThemeData(
//   brightness: Brightness.dark,
//   colorScheme: const ColorScheme.dark(
//     background: Color.fromARGB(255, 112, 110, 110),
//     primary: Color.fromARGB(255, 29, 29, 29),
//     secondary: AppColor.white,
//   ),
// );
