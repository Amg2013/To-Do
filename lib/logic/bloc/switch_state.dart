// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  final bool switchValue;

  const SwitchState({required this.switchValue});

  @override
  // TODO: implement props
  List<Object?> get props => [switchValue];

  @override
  bool get stringify => true;
}

class SwitchInitial extends SwitchState {
  const SwitchInitial({required bool switchValue})
      : super(switchValue: switchValue);
}
