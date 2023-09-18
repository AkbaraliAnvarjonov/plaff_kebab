import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/bloc/checkout/checkout_bloc.dart';
import 'package:plaff_kebab/src/presentation/components/material_border/material_border_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/widget/custom_radio_button.dart';

class CourierCallWidget extends StatelessWidget {
  const CourierCallWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialBorderWidget(
      child: BlocSelector<CheckoutBloc, CheckoutState, bool>(
        selector: (state) => state.isCall,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'call_status_text'.tr,
              ),
              AppUtils.kGap16,
              CustomRadioButton(
                isChecked: state,
                title: 'yes'.tr,
                onTap: () {
                  BlocProvider.of<CheckoutBloc>(context)
                      .add(const CourierCallEvent(isCall: true));
                },
              ),
              AppUtils.kGap12,
              AppUtils.kDivider,
              AppUtils.kGap12,
              CustomRadioButton(
                isChecked: !state,
                title: 'no'.tr,
                onTap: () {
                  BlocProvider.of<CheckoutBloc>(context)
                      .add(const CourierCallEvent(isCall: false));
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
