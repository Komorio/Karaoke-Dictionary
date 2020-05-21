import 'package:flutter/material.dart';

class Constant{
  static String appName = "Karaoke Dictionary";

  static Color primaryColor = Colors.white;
  static Color accentColor = Colors.black;

  static Color backgroundColor = Colors.white;

  static ThemeData primaryTheme = ThemeData(
    backgroundColor: backgroundColor,
    primaryColor:  primaryColor,
    accentColor: accentColor,

    appBarTheme:  AppBarTheme(
      elevation: 0,
      color: backgroundColor,
    ),
  );
}