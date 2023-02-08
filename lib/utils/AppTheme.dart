// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

enum AppTheme { darkTheme, lightTheme }

class AppThemes {
  // static Color mainColor = Colors.white;
  // static Color textColor = const Color(0xffFF0000);
  // static Color contBackColor = const Color(0xffFF4444);
  // static Color floatingColor = const Color(0xffFF4444);
  // static Color iconColor = const Color(0xffFF0000);
  // static Color bottomNavColor = Colors.white;
  // static Color bottomIconColor = Colors.black;

  static final appThemeData = {
    AppTheme.darkTheme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        backgroundColor: const Color(0xFF212121),
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
            unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
            selectedItemColor: Colors.red),
        appBarTheme: AppBarTheme(color: Color.fromARGB(255, 0, 0, 0))),

    //
    //

    AppTheme.lightTheme: ThemeData(
        primarySwatch: Colors.cyan,
        primaryColor: Colors.white,
        brightness: Brightness.light,
        backgroundColor: const Color(0xFFE5E5E5),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 237, 85, 85),
          foregroundColor: Color.fromARGB(255, 221, 92, 92),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.red),
          ),
        ),
        textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.red),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey),
        appBarTheme: AppBarTheme(color: Colors.white)),
  };
}
