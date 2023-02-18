import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

enum AppTheme { darkTheme, lightTheme }

class AppThemes {
  static Color splashColor = HexColor('DB2323');
  static Color mainColor = Colors.white;
  static Color textColor = const Color(0xffFF0000);
  static Color contBackColor = const Color(0xffFF4444);
  static Color floatingColor = const Color(0xffFF4444);
  static Color iconColor = const Color(0xffFF0000);
  static Color taskWidgetColor = HexColor('#FF4444');
  static Color taskWidgetDarkColor = const Color(0xFF928484);
  static Color bottomNavColor = Colors.white;
  static Color bottomIconColor = Colors.black;
  static Color bottomOfShowModel = const Color(0xFFB32D23);

  static final appThemeData = {
    AppTheme.darkTheme: ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      //
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xffFF4444), foregroundColor: Colors.white),
      //
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.white),
      ),
      //
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          unselectedItemColor: Color.fromARGB(255, 125, 86, 86),
          selectedItemColor: Colors.red),
      appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 0, 0, 0)),
      scaffoldBackgroundColor: Colors.black,
    ),

    //
    //

    AppTheme.lightTheme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Colors.white,
        brightness: Brightness.light,
        backgroundColor: const Color(0xFFE5E5E5),
        //
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color(0xffFF4444), foregroundColor: Colors.white),
        //
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.red),
          ),
        ),
        //
        textTheme: const TextTheme(
          subtitle1: TextStyle(color: Colors.red),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey),
        appBarTheme: const AppBarTheme(color: Colors.white)),
  };
}
