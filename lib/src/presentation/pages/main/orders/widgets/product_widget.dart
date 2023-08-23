import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/core/extension/language_extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:plaff_kebab/src/core/constants/constants.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/data/source/hive/product.dart';
import 'package:plaff_kebab/src/presentation/bloc/database/database_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/database/database_event.dart';
import 'package:plaff_kebab/src/presentation/pages/main/orders/widgets/alert_dialog.dart';
import 'package:plaff_kebab/src/presentation/pages/main/orders/widgets/combo_name_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/orders/widgets/modifier_name_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/product/widgets/plus_minus_button.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, required this.products});
  final Products products;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppUtils.kPaddingVer16,
      child: Row(
        children: [
          CachedNetworkImage(
            errorWidget: (context, url, error) =>
                SvgPicture.asset(AppIcons.dish),
            placeholder: (context, url) => SvgPicture.asset(AppIcons.dish),
            height: 88,
            width: 88,
            imageUrl: Constants.imageUrl + products.image,
          ),
          const Gap(16),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(products.name.getLocalizedDescription()),
                products.modifiers.isEmpty
                    ? const Gap(8)
                    : ModifiersNameWidget(
                        products: products,
                      ),
                products.combos.isEmpty
                    ? const Gap(8)
                    : ComboNameWidget(
                        products: products,
                      ),
                const Gap(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${products.price.moneyFormat} ${context.tr("sum")}"),
                    Material(
                      child: Row(
                        children: [
                          PlusMinusButton(
                            isMinus: true,
                            onTap: () {
                              if (products.quantity == 1) {
                                showDialog(
                                    context: context,
                                    builder: (context) =>
                                        AlertDialogWidget(products: products));
                              }
                              BlocProvider.of<DatabaseBloc>(context)
                                  .add(UpdateProduct(products, isMinus: true));
                            },
                          ),
                          Padding(
                            padding: AppUtils.kPaddingHorizontal8,
                            child: Text(products.quantity.toString()),
                          ),
                          PlusMinusButton(
                            onTap: () {
                              BlocProvider.of<DatabaseBloc>(context)
                                  .add(UpdateProduct(products));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
        ],
      ),
    );
  }
}
