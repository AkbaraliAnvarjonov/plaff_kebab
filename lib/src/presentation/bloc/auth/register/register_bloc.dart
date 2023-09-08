import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/core/mixin/cache_mixin.dart';
import 'package:plaff_kebab/src/domain/repositories/auth/auth_repository.dart';
import 'package:plaff_kebab/src/domain/repositories/register/register_repository.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> with CacheMixin {
  RegisterBloc(this.registerUserRepository, this.authRepository)
      : super(const RegisterInitialState()) {
    on<UserRegisterEvent>(_onUserRegister);
    on<PhoneNumberChangedEvent>(_onPhoneNumberChangedEvent);
    on<BloodGroupChangedEvent>(_onBloodGroupChangedEvent);
    on<FullNameChangedEvent>(_onFullNameChangedEvent);
  }

  final RegisterUserRepository registerUserRepository;
  final AuthRepository authRepository;

  void _onPhoneNumberChangedEvent(
      PhoneNumberChangedEvent event, Emitter<RegisterState> emit) {
    emit(const UserPhoneNumberErrorState(showError: false));
  }

  void _onBloodGroupChangedEvent(
      BloodGroupChangedEvent event, Emitter<RegisterState> emit) {
    emit(
      const UserBloodGroupErrorState(
        showError: false,
        errorMessage: 'error',
      ),
    );
  }

  void _onFullNameChangedEvent(
      FullNameChangedEvent event, Emitter<RegisterState> emit) {
    emit(
      const UserFullNameErrorState(
        showError: false,
      ),
    );
  }

  bool _areRequiredFieldValidated(
      UserRegisterEvent event, Emitter<RegisterState> emit) {
    if (event.fullName.isEmpty) {
      emit(
        const UserFullNameErrorState(
          showError: true,
          errorMessage: 'Enter at least 1 character',
        ),
      );
      return false;
    }

    return true;
  }

  Future<void> _onUserRegister(
      UserRegisterEvent event, Emitter<RegisterState> emit) async {
    if (!_areRequiredFieldValidated(event, emit)) {
      return;
    }
    emit(const UserRegisterLoadingState());
    final result = await registerUserRepository.registerUser(
        request: event.additionalProps);
    result.fold(
      (left) {
        emit(const UserRegisterErrorState(errorMessage: ''));
      },
      (r) {
        emit(const UserRegisterSuccessState());
        // authRepository.codeSend(
        //   phoneNumber:
        //       "+998${event.additionalProps["phone"].replaceAll(" ", "")}",
        // );
      },
    );
  }
}
