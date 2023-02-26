part of 'switch_them_bloc.dart';

class SwitchState extends Equatable {
  final bool switchValue;
  const SwitchState({required this.switchValue});

  @override
  List<Object?> get props => [switchValue];

  @override
  bool get stringify => true;
}

class SwitchInitial extends SwitchState {
  const SwitchInitial({required bool switchValue})
      : super(switchValue: switchValue);
}
