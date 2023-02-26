import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:tasks/utils/app_theme.dart';
import '../../bloc_export.dart';
part 'switch_theme_event.dart';
part 'switch_theme_state.dart';

class SwitchThemeBloc extends Bloc<SwitchEvent, SwitchState> {
  static bool isDone = true;
  static bool setTheme() {
    return isDone != isDone;
  }

  SwitchThemeBloc() : super(SwitchInitial(switchValue: isDone)) {
    on<Onevent>(_lightTheme);
    on<ChangeTheme>(_updatedAppTheme);
    on<Offevent>((event, emit) {
      emit(const SwitchState(switchValue: false));
    });
  }

  void _lightTheme(Onevent event, Emitter<SwitchState> emit) {
    emit(const SwitchState(switchValue: true));
  }

  void _updatedAppTheme(ChangeTheme event, Emitter<SwitchState> emit) {
    Brightness? currentBrightness;
    currentBrightness == AppTheme.lightTheme as Brightness
        ? emit(const SwitchState(switchValue: true))
        : emit(const SwitchState(switchValue: false));
  }
}
