import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/data/models/product/history_order/history_order.dart';
import 'package:plaff_kebab/src/presentation/components/material_border/material_border_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/my_orders/current_orders/widget/circle_item.dart';
import 'package:plaff_kebab/src/presentation/pages/main/my_orders/current_orders/widget/container_status_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/my_orders/current_orders/widget/status_widget.dart';

class CurrentOrderStatusItemWidget extends StatelessWidget {
  final Function(Orders? value)? onTap;
  final Orders? order;

  const CurrentOrderStatusItemWidget({
    Key? key,
    this.onTap,
    this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MaterialBorderWidget(
          child: Semantics(
            label: order?.id,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${'order'.tr} №${order?.externalOrderId ?? ''}',
                        style: context.textStyle.regularHeadline,
                        semanticsLabel: '',
                      ),
                    ),
                    AppUtils.kGap8,
                    OrderStatusWidget(
                      text: order?.deliveryType == 'delivery'
                          ? getDeliveryText(order?.statusId ?? '')
                          : getSelfPickUpText(order?.statusId ?? ''),
                      color: context.colorScheme.secondary.withOpacity(0.6),
                      textColor: context.colorScheme.secondary,
                    ),
                  ],
                ),
                AppUtils.kGap24,
                if (order?.deliveryType == 'delivery')
                  Row(
                    children: <Widget>[
                      /// First status
                      const CircleItemSvgWidget(
                        assets: AppIcons.check_icon,
                      ),
                      const Expanded(child: ContainerStatusWidget()),

                      /// Second status
                      CircleItemSvgWidget(
                        assets: AppIcons.chef,
                        status: getDeliveryStatus(order?.statusId) ==
                                OrderStatus.courierPickUp ||
                            getDeliveryStatus(order?.statusId) ==
                                OrderStatus.vendorReady ||
                            getDeliveryStatus(order?.statusId) ==
                                OrderStatus.vendorAccepted,
                      ),
                      Expanded(
                        child: ContainerStatusWidget(
                          status: getDeliveryStatus(order?.statusId) ==
                                  OrderStatus.courierPickUp ||
                              getDeliveryStatus(order?.statusId) ==
                                  OrderStatus.vendorReady ||
                              getDeliveryStatus(order?.statusId) ==
                                  OrderStatus.vendorAccepted,
                        ),
                      ),

                      /// Third status    COURIER_PICKUP
                      CircleItemSvgWidget(
                        assets: AppIcons.fast_delivery,
                        status: getDeliveryStatus(order?.statusId) ==
                            OrderStatus.courierPickUp,
                      ),
                      Expanded(
                        child: ContainerStatusWidget(
                          status: getDeliveryStatus(order?.statusId) ==
                              OrderStatus.courierPickUp,
                        ),
                      ),
                      const CircleItemSvgWidget(
                        assets: AppIcons.finish,
                        status: false,
                      ),
                    ],
                  )
                else
                  Row(
                    children: <Widget>[
                      /// First Status
                      const CircleItemSvgWidget(
                        assets: AppIcons.check_icon,
                      ),
                      const Expanded(
                        child: ContainerStatusWidget(),
                      ),

                      /// Second Status
                      CircleItemSvgWidget(
                          assets: AppIcons.chef,
                          status: getSelfPickUpStatus(order?.statusId) ==
                                  OrderStatus.vendorReady ||
                              getSelfPickUpStatus(order?.statusId) ==
                                  OrderStatus.vendorAccepted),
                      Expanded(
                        child: ContainerStatusWidget(
                            status: getSelfPickUpStatus(order?.statusId) ==
                                    OrderStatus.vendorReady ||
                                getSelfPickUpStatus(order?.statusId) ==
                                    OrderStatus.vendorAccepted),
                      ),

                      /// Third Status
                      CircleItemSvgWidget(
                        assets: AppIcons.finish,
                        status: getSelfPickUpStatus(order?.statusId) ==
                            OrderStatus.vendorReady,
                      )
                    ],
                  )
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onTap!(order),
              borderRadius: AppUtils.kBorderRadius12,
              splashColor: Colors.black12,
            ),
          ),
        ),
      ],
    );
  }
}
