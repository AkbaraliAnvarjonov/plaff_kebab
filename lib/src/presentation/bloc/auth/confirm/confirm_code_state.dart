part of 'confirm_code_bloc.dart';

// ignore: must_be_immutable
class ConfirmCodeState extends Equatable {
  ConfirmCodeState({
    this.confirmStatus = ConfirmStatus.initial,
    this.time = "00",
    this.message = '00:59',
    this.inAsyncCall = false,
    this.isError = false,
  });
  final ConfirmStatus confirmStatus;
  final String time;
  final String message;
  bool inAsyncCall;
  bool isError;

  ConfirmCodeState copyWith({
    String? time,
    ConfirmStatus? confirmStatus,
    String? message,
    bool? inAsyncCall,
    bool? isError,
  }) =>
      ConfirmCodeState(
        time: time ?? this.time,
        confirmStatus: confirmStatus ?? this.confirmStatus,
        message: message ?? this.message,
        inAsyncCall: inAsyncCall ?? this.inAsyncCall,
        isError: isError ?? this.isError,
      );

  @override
  List<Object?> get props => [
        confirmStatus,
        time,
        message,
        inAsyncCall,
        isError,
      ];
}

enum ConfirmStatus {
  initial,
  loading,
  success,
  error,
}

extension ProductStatusX on ConfirmStatus {
  bool get isInitial => this == ConfirmStatus.initial;

  bool get isLoading => this == ConfirmStatus.loading;

  bool get isSuccess => this == ConfirmStatus.success;

  bool get isError => this == ConfirmStatus.error;
}

// class ConfirmInitialState extends ConfirmCodeState {
//   const ConfirmInitialState();

//   @override
//   List<Object?> get props => [];
// }

// class ConfirmCodeSuccessState extends ConfirmCodeState {
//   const ConfirmCodeSuccessState();

//   @override
//   List<Object?> get props => [];
// }

// class ConfirmCodeLoadingState extends ConfirmCodeState {
//   const ConfirmCodeLoadingState();

//   @override
//   List<Object?> get props => [];
// }

// class ConfirmCodePhoneState extends ConfirmCodeState {
//   const ConfirmCodePhoneState(this.phone);

//   final String phone;

//   @override
//   List<Object?> get props => [phone];
// }

// class ConfirmCodeErrorState extends ConfirmCodeState {
//   const ConfirmCodeErrorState({required this.message});
//   final String message;
//   @override
//   List<Object?> get props => [message];
// }
