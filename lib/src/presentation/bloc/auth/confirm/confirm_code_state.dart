part of 'confirm_code_bloc.dart';

abstract class ConfirmCodeState extends Equatable {
  const ConfirmCodeState();
}

class ConfirmInitialState extends ConfirmCodeState {
  const ConfirmInitialState();

  @override
  List<Object?> get props => [];
}

class ConfirmCodeSuccessState extends ConfirmCodeState {
  const ConfirmCodeSuccessState();

  @override
  List<Object?> get props => [];
}

class ConfirmCodeLoadingState extends ConfirmCodeState {
  const ConfirmCodeLoadingState();

  @override
  List<Object?> get props => [];
}

class ConfirmCodePhoneState extends ConfirmCodeState {
  const ConfirmCodePhoneState(this.phone);

  final String phone;

  @override
  List<Object?> get props => [phone];
}

class ConfirmCodeErrorState extends ConfirmCodeState {
  const ConfirmCodeErrorState({required this.message});
  final String message;
  @override
  List<Object?> get props => [message];
}
