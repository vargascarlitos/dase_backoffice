import 'package:flutter/material.dart';

class DaseTheme {
  static const Color primaryColor = Color(0xFFFF2C14); // Color primario
  static const Color complementaryColor =
      Color(0xFF00DAFC); // Color complementario
  static const Color analogColor = Color(0xFFFE0058); // Color análogo

  static const Color darkPrimaryColor =
      Colors.black; // Color primario en versión oscura
  static const Color darkComplementaryColor =
      Colors.blueGrey; // Color complementario en versión oscura
  static const Color darkAnalogColor =
      Colors.red; // Color análogo en versión oscura

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 16.0),
      bodyMedium: TextStyle(fontSize: 14.0),
    ),
    colorScheme: const ColorScheme(
      background: Colors.white,
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: Colors.white,
      secondary: complementaryColor,
      onSecondary: Colors.white,
      error: analogColor,
      onError: Colors.white,
      onBackground: Colors.white,
      surface: Colors.white,
      onSurface: Colors.white,
    ).copyWith(secondary: complementaryColor),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: darkPrimaryColor,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white),
      displayMedium: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
      bodyLarge: TextStyle(fontSize: 16.0, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14.0, color: Colors.white),
    ),
    colorScheme: const ColorScheme(
      background: Colors.grey,
      brightness: Brightness.light,
      primary: darkPrimaryColor,
      onPrimary: Colors.grey,
      secondary: darkComplementaryColor,
      onSecondary: Colors.grey,
      error: darkAnalogColor,
      onError: Colors.grey,
      onBackground: Colors.grey,
      surface: Colors.grey,
      onSurface: Colors.grey,
    ).copyWith(secondary: darkComplementaryColor),
  );
}
