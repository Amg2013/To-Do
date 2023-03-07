import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tasks/config/themes/app_theme.dart';

part 'switch_theme_state.dart';

class SwitchThemeCubit extends Cubit<SwitchThemeState> {
  SwitchThemeCubit()
      : super(SwitchThemeState(
            theme: AppThemes.appThemeData[AppTheme.lightTheme]!));

  void changeTheme() {
    if (state.theme == AppThemes.appThemeData[AppTheme.lightTheme]!) {
      // final ThemeData? themeDataDark = AppThemes.appThemeData[AppTheme.darkTheme];
      final updateState =
          SwitchThemeState(theme: AppThemes.appThemeData[AppTheme.darkTheme]!);
      emit(updateState);
    } else {
      final updateState =
          SwitchThemeState(theme: AppThemes.appThemeData[AppTheme.lightTheme]!);
      emit(updateState);
    }
  }
}
