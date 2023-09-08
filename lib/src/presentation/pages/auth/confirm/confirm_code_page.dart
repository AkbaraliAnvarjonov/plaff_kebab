import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:plaff_kebab/src/config/router/app_routes.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/auth/confirm/confirm_code_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/main/main_bloc.dart';
import 'package:plaff_kebab/src/presentation/components/buttons/bottom_navigation_button.dart';

part 'mixin/confirm_code_mixin.dart';

class ConfirmCodePage extends StatefulWidget {
  const ConfirmCodePage({
    super.key,
    required this.state,
  });

  final AuthSuccessState state;

  @override
  State<ConfirmCodePage> createState() => _ConfirmCodePageState();
}

class _ConfirmCodePageState extends State<ConfirmCodePage>
    with ConfirmCodeMixin {
  @override
  Widget build(BuildContext context) =>
      BlocListener<ConfirmCodeBloc, ConfirmCodeState>(
        listener: (_, state) {
          if (state is ConfirmCodeSuccessState) {
            context
                .read<MainBloc>()
                .add(const MainEventChanged(BottomMenu.search));
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.main,
              (route) => route.isFirst,
            );
          }
        },
        child: Scaffold(
          backgroundColor: context.color.cardColor,
          appBar: AppBar(
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
          body: Column(
            children: [
              AppUtils.kGap16,
              Center(
                child: Pinput(
                  length: 6,
                  autofocus: true,
                  controller: controller,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  onCompleted: (pin) {
                    if (pin.length == 6) {
                      context.read<ConfirmCodeBloc>().add(
                            ConfirmCodeCheckMessageEvent(
                              smsId: widget.state.smsId,
                              otp: pin,
                              data: widget.state.data,
                            ),
                          );
                    }
                  },
                ),
              )
            ],
          ),
          bottomNavigationBar: BlocBuilder<ConfirmCodeBloc, ConfirmCodeState>(
            buildWhen: (previous, current) =>
                previous is AuthPhoneState != current is AuthPhoneState,
            builder: (_, state) => BottomNavigationButton(
              child: ElevatedButton(
                onPressed: state is AuthPhoneState
                    ? () {
                        context.read<ConfirmCodeBloc>().add(
                              ConfirmCodeCheckMessageEvent(
                                smsId: widget.state.smsId,
                                otp: controller.text,
                                data: widget.state.data,
                              ),
                            );
                      }
                    : null,
                child: const Text('Продолжить'),
              ),
            ),
          ),
        ),
      );
}
