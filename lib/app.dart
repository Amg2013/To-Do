import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tasks/UI/cubit/switch_theme_cubit.dart';
import 'package:tasks/config/constants/constnts.dart';
import 'package:tasks/config/routes/app_routs.dart';
import 'package:tasks/logic/bloc_export.dart';
import 'package:tasks/config/locale/app_locale.dart';
import 'UI/screens/splash/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SwitchThemeCubit()),
        BlocProvider(create: (context) => TasksBloc()),
        BlocProvider(create: (context) => LocaleCubit()..getSavedLanguage()),
      ],

      //// here will stat blocs  of theme and locale
      child: BlocBuilder<SwitchThemeCubit, SwitchThemeState>(
        builder: (context, state) {
          final currntTheme = state.theme;

          /// cubit of theme
          return BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, state) {
              if (state is ChangeLocalState) {
                return MaterialApp(
                  theme: currntTheme,

                  // this for cahnge local now
                  locale: state.locale,
                  supportedLocales: const [
                    Locale('en', ''),
                    Locale('ar', ''),
                  ],
                  // localeListResolutionCallback:
                  //     (currentlocale, supportedLocales) {
                  //   for (var locale in supportedLocales) {
                  //     if (currentlocale != null &&
                  //         currentlocale.lang == ) {}
                  //   }
                  // },
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  debugShowCheckedModeBanner: false,

                  home: const Splash(),
                  onGenerateRoute: AppRoutes.onGeranteRoute,
                );
              }
              return Constants.showErrorDilog(
                  context: context,
                  msg: ' some error in loclation plz restart the app');
            },
          );
        },
      ),
    );
  }
}
