import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/config/router/app_routes.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/extension/list_product_extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/bloc/database/database_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/database/database_state.dart';
import 'package:plaff_kebab/src/presentation/components/buttons/bottom_button.dart';

class CartBottomNavigation extends StatelessWidget {
  const CartBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) => state.products.isEmpty
          ? const SizedBox()
          : Material(
              color: context.color.cardColor,
              child: Padding(
                padding: AppUtils.kPaddingAll16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: AppUtils.kPaddingHorizontal16,
                      child: Row(
                        children: [
                          Text(context.tr("cost")),
                          const Spacer(),
                          Text(state.products.calculateTotalPrice().toString())
                        ],
                      ),
                    ),
                    AppUtils.kGap6,
                    BottomButton(
                      text: "checkout_order",
                      onTap: () {
                        Navigator.pushNamed(context, Routes.checkout);
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
