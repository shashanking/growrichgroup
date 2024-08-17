
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFFFD700); // Gold
  static const Color accentColor = Color(0xFFFFC000); // Darker Gold
  static const Color backgroundColor = Colors.black;
  static const Color textColor = Colors.white;

  static ThemeData get theme => ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: backgroundColor,
          foregroundColor: primaryColor,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              color: primaryColor, fontSize: 24, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: textColor),
          bodyMedium: TextStyle(color: textColor),
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white10,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: primaryColor),
          ),
          labelStyle: const TextStyle(color: primaryColor),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: backgroundColor,
            backgroundColor: primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      );
}
