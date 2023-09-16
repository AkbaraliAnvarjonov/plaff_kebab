import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/data/models/product/onedemand_order.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/widget/check_order_item.dart';

class SelectDeliveryTypeWidget extends StatelessWidget {
  final Function(DeliveryTime value)? onTap;
  final DeliveryTime? deliveryTime;

  const SelectDeliveryTypeWidget({
    Key? key,
    this.onTap,
    this.deliveryTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppUtils.kPaddingBottom16,
      child: ClipRRect(
        borderRadius: AppUtils.kBorderRadius12,
        child: Material(
          color: context.color.cardColor,
          child: Column(
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
                  onTap!(DeliveryTime.fastDelivery);
                },
                checked: deliveryTime == DeliveryTime.fastDelivery,
                text: 'fast_delivery1'.tr,
                assets: 'fast_delivery',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 64),
                child: AppUtils.kDivider,
              ),
              CheckOrderItemWidget(
                onTap: () {
                  onTap!(DeliveryTime.scheduledDelivery);
                },
                checked: deliveryTime == DeliveryTime.scheduledDelivery,
                text: 'future_delivery'.tr,
                assets: 'scheduled',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
