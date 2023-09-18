import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/data/models/product/onedemand_order.dart';
import 'package:plaff_kebab/src/presentation/bloc/checkout/checkout_bloc.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/widget/check_order_item.dart';

class DeliveryTimeWidget extends StatelessWidget {
  const DeliveryTimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppUtils.kPaddingBottom16,
      child: ClipRRect(
        borderRadius: AppUtils.kBorderRadius12,
        child: Material(
          color: context.color.cardColor,
          child: BlocSelector<CheckoutBloc, CheckoutState, DeliveryTime>(
              bloc: context.read<CheckoutBloc>(),
              selector: (state) => state.deliveryTime,
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: AppUtils.kPaddingAll12,
                      child: Text(
                        'delivery_method'.tr,
                      ),
                    ),
                    CheckOrderItemWidget(
                      onTap: () {
                        BlocProvider.of<CheckoutBloc>(context).add(
                            const DeliveryTimeEvent(
                                deliveryTime: DeliveryTime.fastDelivery));
                      },
                      checked: state == DeliveryTime.fastDelivery,
                      text: 'fast_delivery1'.tr,
                      assets: 'fast_delivery',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 64),
                      child: AppUtils.kDivider,
                    ),
                    CheckOrderItemWidget(
                      onTap: () {
                        BlocProvider.of<CheckoutBloc>(context).add(
                            const DeliveryTimeEvent(
                                deliveryTime: DeliveryTime.scheduledDelivery));
                      },
                      checked: state == DeliveryTime.scheduledDelivery,
                      text: 'future_delivery'.tr,
                      assets: 'scheduled',
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
