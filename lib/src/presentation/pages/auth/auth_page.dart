import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/config/router/app_routes.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:plaff_kebab/src/presentation/components/buttons/bottom_navigation_button.dart';
import 'package:plaff_kebab/src/presentation/components/inputs/custom_text_field.dart';
import 'package:plaff_kebab/src/presentation/components/inputs/masked_text_input_formatter.dart';
import 'package:plaff_kebab/src/presentation/components/loading_widgets/modal_progress_hud.dart';

part 'mixin/auth_mixin.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with AuthMixin {
  @override
  Widget build(BuildContext context) => BlocListener<AuthBloc, AuthState>(
        listener: (_, state) {
          if (state is AuthSuccessState) {
            Navigator.pushNamed(
              context,
              Routes.confirmCode,
              arguments: state,
            );
            context.read<AuthBloc>().add(
                  AuthPhoneChangeEvent(phoneController.text),
                );
          }
          if (state is AuthErrorState) {
            Navigator.pushNamed(
              context,
              Routes.register,
              arguments: phoneController.text,
            );
            context.read<AuthBloc>().add(
                  AuthPhoneChangeEvent(phoneController.text),
                );
          }
        },
        child: Scaffold(
          backgroundColor: context.color.cardColor,
          appBar: AppBar(
            backgroundColor: context.color.cardColor,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: AppUtils.kPaddingHor16Ver12,
                  child: Text(
                    context.tr("register"),
                    style: context.textStyle.regularTitle1,
                  ),
                ),
              ),
            ),
          ),
          body: BlocBuilder<AuthBloc, AuthState>(
            buildWhen: (previous, current) =>
                previous is AuthLoadingState != current is AuthLoadingState,
            builder: (_, state) => ModalProgressHUD(
              inAsyncCall: state is AuthLoadingState,
              child: Padding(
                padding: AppUtils.kPaddingHorizontal16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppUtils.kGap20,
                    Text(
                      context.tr("number_phone"),
                      style: context.textStyle.smallLink,
                    ),
                    AppUtils.kGap4,
                    CustomTextField(
                      borderColor: context.colorScheme.primary,
                      controller: phoneController,
                      autofocus: true,
                      haveBorder: true,
                      fillColor: context.color.cardColor,
                      filled: true,
                      inputFormatters: [
                        MaskedTextInputFormatter(
                          mask: '## ### ## ##',
                          separator: ' ',
                          filter: RegExp('[0-9]'),
                        ),
                      ],
                      onChanged: (value) {
                        context.read<AuthBloc>().add(
                              AuthPhoneChangeEvent(value ?? ''),
                            );
                      },
                      contentPadding: AppUtils.kPaddingHor14Ver16,
                      keyboardType: TextInputType.phone,
                      prefixText: '+998 ',
                      prefixStyle: Theme.of(context).textTheme.titleMedium,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: BlocBuilder<AuthBloc, AuthState>(
            buildWhen: (previous, current) =>
                previous is AuthPhoneState != current is AuthPhoneState,
            builder: (_, state) => BottomNavigationButton(
              child: ElevatedButton(
                onPressed: state is AuthPhoneState
                    ? () {
                        context
                            .read<AuthBloc>()
                            .add(CheckPhoneNumberEvent(phoneController.text));
                      }
                    : null,
                child: Text(
                  context.tr("continue"),
                  style: context.textStyle.appBarTitle,
                ),
              ),
            ),
          ),
        ),
      );
}
