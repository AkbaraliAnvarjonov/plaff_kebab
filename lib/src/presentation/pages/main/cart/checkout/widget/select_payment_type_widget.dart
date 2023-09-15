import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/data/models/product/onedemand_order.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/widget/check_order_item.dart';

class SelectPaymentTypeWidget extends StatelessWidget {
  final Function(String value)? onTap;
  final String? payment;

  const SelectPaymentTypeWidget({
    Key? key,
    this.onTap,
    this.payment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppUtils.kBorderRadius12,
      child: ColoredBox(
        color: context.color.cardColor,
        child: Column(
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
              onTap: () => onTap!(PaymentType.cash.toString()),
              checked: payment == PaymentType.cash.toString(),
              text: 'cash'.tr,
              assets: 'money',
            ),
            Padding(
              padding: const EdgeInsets.only(left: 64),
              child: AppUtils.kDivider,
            ),
            CheckOrderItemWidget(
              onTap: () => onTap!(PaymentType.payMe.toString()),
              checked: payment == PaymentType.payMe.toString(),
              text: 'Payme',
              assets: 'payme',
            ),
            Padding(
              padding: const EdgeInsets.only(left: 64),
              child: AppUtils.kDivider,
            ),
            CheckOrderItemWidget(
              onTap: () => onTap!(PaymentType.click.toString()),
              checked: payment == PaymentType.click.toString(),
              text: 'Click',
              assets: 'click',
            ),
          ],
        ),
      ),
    );
  }
}
