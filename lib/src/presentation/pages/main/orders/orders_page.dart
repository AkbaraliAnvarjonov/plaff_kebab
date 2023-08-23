import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';

import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/bloc/database/database_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/database/database_event.dart';
import 'package:plaff_kebab/src/presentation/bloc/database/database_state.dart';
import 'package:plaff_kebab/src/presentation/components/material_border/material_border_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/orders/widgets/product_widget.dart';

part 'mixin/order_mixin.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage>
    with SingleTickerProviderStateMixin, OrdersMixin {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initStateController(this);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Мои заказы'),
        actions: [
          BlocBuilder<DatabaseBloc, DatabaseState>(
            builder: (context, state) {
              if (state.status.isLoading) {
                return const CircularProgressIndicator();
              }
              if (state.products.isNotEmpty) {
                return IconButton(
                    onPressed: () {
                      BlocProvider.of<DatabaseBloc>(context)
                          .add(DeleteProducts());
                    },
                    icon: SvgPicture.asset(AppIcons.delete_icon));
              }
              return const SizedBox();
            },
          )
        ],
      ),
      body: BlocBuilder<DatabaseBloc, DatabaseState>(
        builder: (context, state) {
          if (state.status.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.products.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.bag,
                    height: 104,
                    width: 104,
                  ),
                  AppUtils.kGap24,
                  Text(
                    context.tr("empty"),
                    style: context.textStyle.regularSubheadline,
                  )
                ],
              ),
            );
          }
          return CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                  child: Padding(
                padding: AppUtils.kPaddingVer16,
                child: MaterialBorderWidget(
                  padding: AppUtils.kPaddingHorizontal16,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.products.length,
                    itemBuilder: (context, index) =>
                        ProductItemWidget(products: state.products[index]),
                    separatorBuilder: (context, index) => Divider(
                      height: 1,
                      color: context.color.black.withOpacity(0.1),
                    ),
                  ),
                ),
              ))
            ],
          );
        },
      ));
}
