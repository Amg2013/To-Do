import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tasks/UI/screens/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/UI/screens/ListTasks.dart';
import 'package:tasks/data/Task.dart';
import 'package:tasks/logic/bloc/switch_bloc.dart';
import 'package:tasks/utils/AppTheme.dart';

import 'logic/Bloc_export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  storage:
  storage;
  BlocOverrides.runZoned(
    () => runApp(MyApp()),
  );

  // HydratedBlocOverrides.runZoned(
  //   () => runApp(MyApp()),
  // storage:storage;
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SwitchBloc()),
        BlocProvider(
            create: (context) => TasksBloc()
              ..add(AddTask(
                  task: Task(
                      title: 'first one work',
                      id: '9',
                      description: 'sdfsdf'))))
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            color: HexColor('#E5E5E5'),
            home: HomeList(),
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