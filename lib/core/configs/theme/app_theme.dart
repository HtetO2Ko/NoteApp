import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: Colors.black,
    secondaryHeaderColor: Colors.black,
    brightness: Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      labelStyle: TextStyle(
        color: Colors.black54,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: Colors.white,
    secondaryHeaderColor: Colors.black,
    brightness: Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.black,
      labelStyle: TextStyle(
        color: Colors.white,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
