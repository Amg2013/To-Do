import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'UI/screens/splash.dart';
import 'logic/bloc_export.dart';
import 'logic/my_bloc_obseriver.dart';
import 'utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SwitchThemeBloc()),
        BlocProvider(create: (context) => TasksBloc()
            //   ..add(AddTask(
            //       task: Task(title: 'first task', id: '9', description: 'A')))

            )
      ],
      child: BlocBuilder<SwitchThemeBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            home: const Splash(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
