import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;
  static String get localeName => Platform.localeName;
  AppLocalizations({required this.locale});
//as long as we will use this class all over the app ,
//  'of' is a function that returns this class static only for it
  static AppLocalizations of(BuildContext context) {
    // this lien to tell the flutter this class type is Localizations that because i did't extend any class to figer that

    return Localizations.of(context, AppLocalizations);

    // return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

// this is the addmin of localizion
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

// this map to handel all string in json file
  late Map<String, String> _localizedStrings;
// this to get value if while it't null
// this will tranalate based on key if there is no key it will retrun null
  String? translate(String key) {
    return _localizedStrings[key] ?? 'someErorrInTreanslateFun';
  }

  bool IsEnglish() => locale == Locale('en');

  //static const String _path = 'assets/lang/';
  // function to load the strings of the current local lang
  Future loadJsonLangs() async {
    String encodeString =
        await rootBundle.loadString("assets/lang/${locale.languageCode}.json");

    // here i used dynamic as key not string althought I now the key is dynamic
    //but this better for dart in order not go into crach
    Map<String, dynamic> jsonMap = json.decode(encodeString);
    debugPrint(encodeString);
    // here i retrurn the key to string agine
    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }
}

// this privet to be uesd only in this file
class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();
  // to check os lang support or not
  @override
  bool isSupported(Locale locale) {
    return ['ar', 'en'].contains(locale.languageCode);
  }

//  load the class holding our data
  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale: locale);
    await localizations.loadJsonLangs();
    return localizations;
  }

//Returns true if the resources for this
//delegate should be loaded again by calling the [load] method.
  @override
  bool shouldReload(covariant LocalizationsDelegate<dynamic> old) => false;
}

// solid pren number two open-cloesd open for extension not for modefiction
extension TranslateString on String {
  String tr(BuildContext context) {
    return AppLocalizations.of(context).translate(this)!;
  }
}
