// ignore_for_file: file_names

import 'package:flutter/material.dart';

enum AppTheme { darkTheme, lightTheme }

class AppThemes {
  static Color mainColor = Colors.white;
  static Color textColor = const Color(0xffFF0000);
  static Color contBackColor = const Color(0xffFF4444);
  static Color floatingColor = const Color(0xffFF4444);
  static Color iconColor = const Color(0xffFF0000);
  static Color bottomNavColor = Colors.white;
  static Color bottomIconColor = Colors.black;
  static final appThemeData = {
    AppTheme.darkTheme: ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      backgroundColor: const Color(0xFF212121),
      dividerColor: Colors.black54,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          unselectedItemColor: Color.fromARGB(255, 0, 0, 0)),
    ),

    //
    //

    AppTheme.lightTheme: ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.white,
      brightness: Brightness.light,
      backgroundColor: const Color(0xFFE5E5E5),
      dividerColor: contBackColor,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromARGB(255, 237, 85, 85),
        foregroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.black),
        ),
      ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.black),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: bottomNavColor,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey),
    ),
  };
}
