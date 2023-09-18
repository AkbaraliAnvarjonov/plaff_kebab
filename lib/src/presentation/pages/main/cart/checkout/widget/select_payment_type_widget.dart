import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/data/models/product/onedemand_order.dart';
import 'package:plaff_kebab/src/presentation/bloc/checkout/checkout_bloc.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/widget/check_order_item.dart';

class SelectPaymentTypeWidget extends StatelessWidget {
  final String? payment;

  const SelectPaymentTypeWidget({
    Key? key,
    this.payment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppUtils.kBorderRadius12,
      child: ColoredBox(
        color: context.color.cardColor,
        child: BlocSelector<CheckoutBloc, CheckoutState, PaymentType>(
            selector: (state) => state.paymentType,
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: AppUtils.kPaddingAll12,
                    child: Text(
                      'payment_type'.tr,
                    ),
                  ),
                  CheckOrderItemWidget(
                    onTap: () => BlocProvider.of<CheckoutBloc>(context).add(
                        const PaymentTypeEvent(paymentType: PaymentType.cash)),
                    checked: state == PaymentType.cash,
                    text: 'Cash'.tr,
                    assets: 'money',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 64),
                    child: AppUtils.kDivider,
                  ),
                  CheckOrderItemWidget(
                    onTap: () => BlocProvider.of<CheckoutBloc>(context).add(
                        const PaymentTypeEvent(paymentType: PaymentType.payMe)),
                    checked: state == PaymentType.payMe,
                    text: 'Payme',
                    assets: 'payme',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 64),
                    child: AppUtils.kDivider,
                  ),
                  CheckOrderItemWidget(
                    onTap: () => BlocProvider.of<CheckoutBloc>(context).add(
                        const PaymentTypeEvent(paymentType: PaymentType.click)),
                    checked: state == PaymentType.click,
                    text: 'Click',
                    assets: 'click',
                  ),
                ],
              );
            }),
      ),
    );
  }
}
