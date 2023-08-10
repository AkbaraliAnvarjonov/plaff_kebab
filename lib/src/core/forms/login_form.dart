import 'package:formz/formz.dart';
import 'package:plaff_kebab/src/core/inputs/email_input.dart';
import 'package:plaff_kebab/src/core/inputs/password_input.dart';

class LoginForm with FormzMixin {
  LoginForm({
    required this.emailInput,
    required this.passwordInput,
  });

  final EmailInput emailInput;
  final PasswordInput passwordInput;

  @override
  List<FormzInput> get inputs => [
        emailInput,
        passwordInput,
      ];
}
