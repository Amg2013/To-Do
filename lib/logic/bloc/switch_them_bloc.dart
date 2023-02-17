import 'package:equatable/equatable.dart';

import '../bloc_export.dart';

part 'switch_theme_event.dart';
part 'switch_theme_state.dart';

class SwitchThemeBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchThemeBloc() : super(const SwitchInitial(switchValue: false)) {
    on<Onevent>((event, emit) {
      emit(const SwitchState(switchValue: true));
    });

    on<Offevent>((event, emit) {
      emit(const SwitchState(switchValue: false));
    });
  }
}
