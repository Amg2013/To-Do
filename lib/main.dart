import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tasks/utils/app_locale.dart';
import 'UI/screens/splash.dart';
import 'logic/bloc_export.dart';
import 'logic/helpers/cash.dart';
import 'logic/my_bloc_obseriver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  // to take instance of bloce observer
  Bloc.observer = MyBlocObserver();
  // this will init the cashed locale
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LocaleCubit()..getSavedLanguage()),
          BlocProvider(create: (context) => SwitchThemeBloc()),
          BlocProvider(create: (context) => TasksBloc())
        ],
        child: BlocBuilder<LocaleCubit, LocaleState>(builder: (context, state) {
          if (state is ChangeLocalState) {
            return MaterialApp(
              locale: state.locale,
              debugShowCheckedModeBanner: false,
              supportedLocales: const [
                Locale('ar', ''),
                Locale('en', ''),
              ],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              localeResolutionCallback: checkCurrentLocale,
              //   for (var locale in supportedLocales) {
              //     if (currentlocale != null &&
              //         currentlocale.languageCode == locale.languageCode) {
              //       return currentlocale;
              //     }
              //   }

              //   return supportedLocales.first;
              // },
              home: const Splash(),
            );
          }
          return ScaffoldMessenger(
            child: CircularProgressIndicator(),
          );
        }));
  }

  //static String currenlocale = AppLocalizations.localeName;
  Locale checkCurrentLocale(currentlocale, supportedLocales) {
    for (var locale in supportedLocales) {
      if (currentlocale != null &&
          currentlocale.languageCode == locale.languageCode) {
        return currentlocale;
      }
    }
    return supportedLocales.second;
  }
}
