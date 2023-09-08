import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/core/mixin/cache_mixin.dart';
import 'package:plaff_kebab/src/data/models/auth/verify_request.dart';
import 'package:plaff_kebab/src/domain/repositories/auth/auth_repository.dart';

part 'confirm_code_state.dart';

part 'confirm_code_event.dart';

class ConfirmCodeBloc extends Bloc<ConfirmCodeEvent, ConfirmCodeState>
    with CacheMixin {
  ConfirmCodeBloc(this.authRepository) : super(ConfirmCodeState()) {
    on<ConfirmCodeCheckMessageEvent>(_onConfirmCode);
    on<ConfirmTime>(_confirmTime);
    on<ConfirmErrorChange>(_confirmErrorChange);
  }

  final AuthRepository authRepository;

  Future<void> _onConfirmCode(ConfirmCodeCheckMessageEvent event,
      Emitter<ConfirmCodeState> emit) async {
    emit(state.copyWith(
        confirmStatus: ConfirmStatus.loading, inAsyncCall: true));
    final result = await authRepository.verifySmsCode(
      request: VerifyRequest(
        registerType: 'app',
        data: event.data,
      ),
      smsId: event.smsId,
      otp: event.otp,
    );
    result.fold(
      (l) {
        emit(state.copyWith(
          confirmStatus: ConfirmStatus.error,
          message: l.toString(),
          isError: true,
          inAsyncCall: false,
        ));
      },
      (r) {
        setUserInfo(
          name: r.name,
          id: r.id,
          phoneNumber: r.phone,
          accessToken: r.accessToken,
          refreshToken: r.refreshToken,
        );

        emit(state.copyWith(confirmStatus: ConfirmStatus.success));
      },
    );
  }

  _confirmTime(ConfirmTime event, Emitter<ConfirmCodeState> emit) async {
    for (int i = 60; i >= 0; i--) {
      emit(state.copyWith(time: formatCountdownTime(i)));
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  _confirmErrorChange(
      ConfirmErrorChange event, Emitter<ConfirmCodeState> emit) {
    emit(state.copyWith(isError: false));
  }

  String formatCountdownTime(int seconds) {
    final Duration duration = Duration(seconds: seconds);
    final String formattedTime =
        '${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
    return formattedTime;
  }
}
