import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tasks/UI/screens/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/logic/bloc/switch_bloc.dart';
import 'package:tasks/utils/AppTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SwitchBloc()),
        // BlocProvider(
        // create: (context) =>TasksBloc())
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            color: HexColor('#E5E5E5'),
            home: const Splash(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
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