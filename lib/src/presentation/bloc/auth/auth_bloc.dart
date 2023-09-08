import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/data/models/auth/send_message_request.dart';
import 'package:plaff_kebab/src/domain/repositories/auth/auth_repository.dart';

part 'auth_state.dart';

part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepository) : super(const AuthInitialState()) {
    on<AuthPhoneChangeEvent>(_onChanged);
    on<AuthCheckMessageEvent>(_onSendMessage);
    on<CheckPhoneNumberEvent>(_onCheckPhoneNumber);
  }

  final AuthRepository authRepository;

  void _onChanged(AuthPhoneChangeEvent event, Emitter<AuthState> emit) {
    if (event.value.length <= 11) {
      emit(const AuthInitialState());
      return;
    }

    emit(AuthPhoneState(event.value));
  }

  Future<void> _onSendMessage(
      AuthCheckMessageEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoadingState());

    final result = await authRepository.codeMessage(
      request: SendMessageRequest(
        clientType: 'WEB_USER',
        email: '',
        googleToken: '',
        phone: "+998${event.phone.replaceAll(" ", "")}",
        registerType: 'phone',
      ),
    );
    result.fold(
      (l) {
        emit(const AuthErrorState());
      },
      (r) {
        emit(
          AuthSuccessState(
            smsId: r.data?['sms_id'] as String? ?? '',
            phone: "+998${event.phone.replaceAll(" ", "")}",
            uiPhone: event.phone,
            data: r.data?['data'] as Map? ?? {},
          ),
        );
      },
    );
  }

  Future<void> _onCheckPhoneNumber(
      CheckPhoneNumberEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoadingState());

    final result = await authRepository.phoneNumber(
      phoneNumber: "+998${event.phone.replaceAll(" ", "")}",
    );
    result.fold(
      (l) {
        emit(const AuthErrorState());
      },
      (r) {
        emit(AuthSuccessState(
          smsId: r.id,
          phone: r.phone,
          uiPhone: event.phone,
          data: r.toJson(),
        ));
        authRepository.codeSend(
          phoneNumber: "+998${event.phone.replaceAll(" ", "")}",
        );
      },
    );
  }
}
