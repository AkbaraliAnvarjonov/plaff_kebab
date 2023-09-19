import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/data/models/product/history_order/history_order.dart';
import 'package:plaff_kebab/src/presentation/pages/main/my_orders/current_orders/widget/status_widget.dart';

class HistoryOrderItemWidget extends StatelessWidget {
  final Function()? onTap;
  final Orders orders;

  const HistoryOrderItemWidget({
    Key? key,
    this.onTap,
    required this.orders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint(orders.statusId ?? '');
    return Material(
      borderRadius: AppUtils.kBorderRadius12,
      color: context.color.cardColor,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppUtils.kBorderRadius12,
        child: Ink(
          padding: AppUtils.kPaddingHor16Ver12,
          color: context.color.cardColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Semantics(
                label: orders.id,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        '${'order'.tr} №${orders.externalOrderId ?? ''}',
                        style: context.textStyle.regularHeadline,
                        semanticsLabel: '',
                      ),
                    ),
                    Padding(
                      padding: AppUtils.kPaddingleft8,
                      child: OrderStatusWidget(
                        textColor: context.colorScheme.onSecondary,
                        color: context.colorScheme.onSecondary.withOpacity(0.5),
                        text: orders.deliveryType == 'delivery'
                            ? getDeliveryText(
                                orders.statusId ?? '',
                              )
                            : getSelfPickUpText(
                                orders.statusId ?? '',
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              AppUtils.kGap16,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      ((orders.orderAmount ?? 0) + (orders.deliveryPrice ?? 0))
                          .moneyFormatSymbol,
                      style: context.textStyle.regularHeadline,
                      semanticsLabel: '',
                    ),
                  ),
                  Icon(
                    Icons.calendar_month,
                    size: 16,
                    color: context.color.black3,
                  ),
                  AppUtils.kGap2,
                  Text(
                    orders.createdAt ?? '',
                    style: context.textStyle.regularHeadline,
                    semanticsLabel: '',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
