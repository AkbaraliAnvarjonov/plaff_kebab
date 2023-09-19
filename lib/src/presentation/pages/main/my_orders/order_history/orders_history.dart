import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/data/models/product/history_order/history_order.dart';
import 'package:plaff_kebab/src/presentation/bloc/order/order_bloc.dart';
import 'package:plaff_kebab/src/presentation/pages/main/my_orders/order_history/widget/history_order_item.dart';

class HistoryOrdersPage extends StatelessWidget {
  const HistoryOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(child: AppUtils.kGap12),
        BlocSelector<OrderBloc, OrderState, List<Orders>>(
            selector: (state) => state.orders,
            builder: (context, state) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, index) {
                    return Padding(
                      padding: AppUtils.kPaddingBottom16,
                      child: HistoryOrderItemWidget(
                        orders: state[index],
                        onTap: () {},
                      ),
                    );
                  },
                  childCount: state.length,
                ),
              );
            }),
      ],
    );
  }
}
