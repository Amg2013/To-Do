import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

// key of cashed code
  static const String _cachedCode = "cachedCode";
//it will return the langauge code if it’s cached
//else it will return en by default
  static String getCachedLanguage() {
    final code = prefs.getString(_cachedCode);
    if (code != null) {
      return code;
    } else {
      return 'en';
    }
  }

  static Future<void> cacheLanguage(String code) async {
    await prefs.setString(_cachedCode, code);
  }
}
