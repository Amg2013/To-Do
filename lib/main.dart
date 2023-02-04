import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tasks/UI/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      color: HexColor('#E5E5E5'),
      home: const Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
// BlocProvider(
//       create: (context) => ThemeBloc(),
//       child: MaterialApp(
//         color: HexColor('#E5E5E5'),
//         home: const Splash(),
//         debugShowCheckedModeBanner: false,
//       ),