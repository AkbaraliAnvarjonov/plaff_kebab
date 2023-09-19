import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/data/models/product/history_order/history_order.dart';
import 'package:plaff_kebab/src/presentation/bloc/order/order_bloc.dart';
import 'package:plaff_kebab/src/presentation/pages/main/my_orders/current_orders/widget/current_order_status_item_widget.dart';

class CurrentOrdersPage extends StatelessWidget {
  const CurrentOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          BlocSelector<OrderBloc, OrderState, List<Orders>>(
              selector: (state) => state.orders,
              builder: (context, state) {
                return SliverList.separated(
                  itemCount: state.length,
                  itemBuilder: (context, index) => CurrentOrderStatusItemWidget(
                    order: state[index],
                    onTap: (value) {
                      // Get.toNamed(
                      //   AppRoutes.currentOrdersDetail,
                      //   arguments:
                      //       CurrentOrderDetailPageArguments(id: value?.id ?? ''),
                      // );
                    },
                  ),
                  separatorBuilder: (context, index) => AppUtils.kGap12,
                );
              }),
        ],
      ),
    );
  }
}
