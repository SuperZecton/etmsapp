import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.light(),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
      ));

  static ThemeData darkTheme = ThemeData(
    primaryColor: darkPrimary500,
    backgroundColor: darkBackgroundColor,
    bottomAppBarColor: darkAppbarColor,
    colorScheme: ColorScheme.dark(),
    appBarTheme: AppBarTheme(
      backgroundColor: darkAppbarColor,
    ),
    buttonTheme: ButtonThemeData(
        buttonColor: darkSecondaryColor, textTheme: ButtonTextTheme.accent),
  );
}
