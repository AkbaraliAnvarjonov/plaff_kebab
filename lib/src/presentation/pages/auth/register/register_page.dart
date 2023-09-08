import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/config/router/app_routes.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/auth/register/register_bloc.dart';
import 'package:plaff_kebab/src/presentation/components/inputs/custom_text_field.dart';
import 'package:sms_autofill/sms_autofill.dart';

part 'package:plaff_kebab/src/presentation/pages/auth/register/mixin/register_mixin.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
    required this.phoneNumber,
  });
  final String phoneNumber;
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with RegisterMixin {
  @override
  Widget build(BuildContext context) =>
      BlocConsumer<RegisterBloc, RegisterState>(
        bloc: _bloc,
        listener: (_, state) {
          if (state is UserRegisterSuccessState) {
            Navigator.pushNamed(context, Routes.confirmCode,
                arguments: AuthSuccessState(
                    smsId: "smsId",
                    phone: "phone",
                    uiPhone: "uiPhone",
                    data: {
                      "fcm_token":
                          "e3kRaasSR4iO2_QTiQ65wb:APA91bFyZq7vRv01HGUa8fbUcW-HTm7k0ingOsE3UCWMxEEIPsI6b8lP2cyBet1HbR-jNGcdSfE-uowgchcod8LJVsjaYYjqM0v6N4lLKD2c5Pp8bxhLus4bE29_TmQ0CqUfDTjO2bD8",
                      "phone": "+998${widget.phoneNumber.replaceAll(" ", "")}"
                    }));
          }
        },
        builder: (_, state) => Scaffold(
          backgroundColor: context.color.cardColor,
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight - 12),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(context.tr("full_name")),
                ),
              ),
            ),
          ),
          body: SafeArea(
            minimum: AppUtils.kPaddingAll16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppUtils.kGap20,
                Text(
                  context.tr("fullName"),
                  style: context.textStyle.smallLink,
                ),
                AppUtils.kGap4,
                CustomTextField(
                  haveBorder: false,
                  fillColor: const Color(0xFFEDEFF2),
                  filled: true,
                  onChanged: (value) {
                    _bloc.add(const FullNameChangedEvent());
                  },
                  errorText: state is UserFullNameErrorState
                      ? state.errorMessage
                      : null,
                  showError: state is UserFullNameErrorState && state.showError,
                  controller: _fullNameController,
                  hintText: context.tr("enter_fullName"),
                ),
              ],
            ),
          ),
          bottomNavigationBar: SafeArea(
            minimum: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: ElevatedButton(
              onPressed: () {
                _registerUser(widget.phoneNumber);
              },
              child: Text(
                context.tr("continue"),
                style: context.textStyle.appBarTitle,
              ),
            ),
          ),
        ),
      );
}
