import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/auth/confirm/confirm_code_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/location/location_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/main/main_bloc.dart';
import 'package:plaff_kebab/src/presentation/components/buttons/bottom_navigation_button.dart';
import 'package:plaff_kebab/src/presentation/components/loading_widgets/modal_progress_hud.dart';
import 'package:sms_autofill/sms_autofill.dart';

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
          if (state.confirmStatus.isSuccess) {
            context
                .read<MainBloc>()
                .add(const MainEventChanged(BottomMenu.search));
            BlocProvider.of<LocationBloc>(context)
                .add(const GetCustomerAdresses());
            BlocProvider.of<ConfirmCodeBloc>(context).close();

            Navigator.popUntil(
              context,
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
          body: BlocBuilder<ConfirmCodeBloc, ConfirmCodeState>(
              buildWhen: (previous, current) {
            if (previous.confirmStatus != current.confirmStatus ||
                previous.isError != current.isError ||
                previous.inAsyncCall != current.inAsyncCall) {
              return true;
            }
            return false;
          }, builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state.inAsyncCall,
              child: Column(
                children: [
                  AppUtils.kGap16,
                  Center(
                    child: Pinput(
                      onChanged: (value) {
                        if (value.length == 5 && state.isError) {
                          BlocProvider.of<ConfirmCodeBloc>(context)
                              .add(const ConfirmErrorChange());
                        }
                      },
                      forceErrorState: state.isError,
                      errorText: "Kod xato",
                      length: 6,
                      autofocus: true,
                      controller: controller,
                      errorPinTheme: errorPinTheme,
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
            );
          }),
          bottomNavigationBar: BlocBuilder<ConfirmCodeBloc, ConfirmCodeState>(
            buildWhen: (previous, current) => previous.time != current.time,
            builder: (_, state) => SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  state.time != "00:00"
                      ? Text(state.time)
                      : TextButton(
                          onPressed: () {},
                          child: Text(
                            context.tr("resend"),
                            style: context.textStyle.regularSubheadline,
                          )),
                  BottomNavigationButton(
                    child: SizedBox(
                      width: double.infinity,
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
                        child: Text(context.tr("continue")),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
