import 'package:flutter/cupertino.dart';
import '../bloc_export.dart';
import '../helpers/cash.dart';
part 'locale_cubit_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitState());

// every time we change locale this local state will be emmited
  void getSavedLanguage() {
    final cachedLanguageCode = CacheHelper.getCachedLanguage();
    emit(ChangeLocalState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> cahngeLanguage(String languageCode) async {
    await CacheHelper.cacheLanguage(languageCode);
    emit(ChangeLocalState(locale: Locale(languageCode)));
  }
}
