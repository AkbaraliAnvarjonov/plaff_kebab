import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/core/mixin/cache_mixin.dart';
import 'package:plaff_kebab/src/data/models/auth/verify_request.dart';
import 'package:plaff_kebab/src/domain/repositories/auth/auth_repository.dart';

part 'confirm_code_state.dart';

part 'confirm_code_event.dart';

class ConfirmCodeBloc extends Bloc<ConfirmCodeEvent, ConfirmCodeState>
    with CacheMixin {
  ConfirmCodeBloc(this.authRepository) : super(const ConfirmInitialState()) {
    on<ConfirmCodeCheckMessageEvent>(_onConfirmCode);
  }

  final AuthRepository authRepository;

  Future<void> _onConfirmCode(ConfirmCodeCheckMessageEvent event,
      Emitter<ConfirmCodeState> emit) async {
    emit(const ConfirmCodeLoadingState());
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
        emit(ConfirmCodeErrorState(message: l.toString()));
      },
      (r) {
        setUserInfo(
          name: r.name,
          id: r.id,
          phoneNumber: r.phone,
          accessToken: r.accessToken,
          refreshToken: r.refreshToken,
        );

        emit(
          const ConfirmCodeSuccessState(),
        );
      },
    );
  }
}
