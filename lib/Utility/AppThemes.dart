import 'package:flutter/material.dart';

ThemeData appLightThemeData = ThemeData.light().copyWith(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(),
  textTheme: TextTheme(),
  appBarTheme: AppBarTheme(),
);

ThemeData appDarkThemeData = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(),
  textTheme: TextTheme(),
  appBarTheme: AppBarTheme(),
);
