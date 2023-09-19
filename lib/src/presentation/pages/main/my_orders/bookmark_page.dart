import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/presentation/bloc/order/order_bloc.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/widget/custom_tab_bar.dart';
import 'package:plaff_kebab/src/presentation/pages/main/my_orders/current_orders/current_orders.dart';
import 'package:plaff_kebab/src/presentation/pages/main/my_orders/order_history/orders_history.dart';

part 'mixin/favouritce_mixin.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage>
    with FavouriteMixin, TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my_orders'.tr),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: CustomTabBar(
            controller: tabController,
            labels: ['current_orders'.tr, 'history_of_orders'.tr],
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          CurrentOrdersPage(),
          HistoryOrdersPage(),
        ],
      ),
    );
  }
}
