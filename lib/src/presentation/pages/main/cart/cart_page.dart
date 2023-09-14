import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/bloc/database/database_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/database/database_event.dart';
import 'package:plaff_kebab/src/presentation/bloc/database/database_state.dart';
import 'package:plaff_kebab/src/presentation/components/inputs/custom_text_field.dart';
import 'package:plaff_kebab/src/presentation/components/material_border/material_border_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/widgets/bottom_navigation.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/widgets/cart_empty_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/widgets/product_widget.dart';

part 'mixin/cart_mixin.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage>
    with SingleTickerProviderStateMixin, OrdersMixin {
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
            return const OrderEmptyWidget();
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
                ),
              ),
              SliverToBoxAdapter(
                child: MaterialBorderWidget(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.tr("comment")),
                    CustomTextField(
                      controller: orderController,
                      haveBorder: false,
                      fillColor: const Color(0xFFEDEFF2),
                      filled: true,
                      hintText: context.tr("add_comment"),
                    ),
                  ],
                )),
              )
            ],
          );
        },
      ),
      bottomNavigationBar: const CartBottomNavigation());
}
