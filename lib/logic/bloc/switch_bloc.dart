import 'package:equatable/equatable.dart';

import '../bloc_export.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchInitial(switchValue: false)) {
    on<Onevent>((event, emit) {
      emit(const SwitchState(switchValue: true));
    });

    on<Offevent>((event, emit) {
      emit(const SwitchState(switchValue: false));
    });
  }
}
