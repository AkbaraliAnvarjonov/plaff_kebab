import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/extension/language_extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/data/models/product/onedemand_order.dart';
import 'package:plaff_kebab/src/data/source/hive/product.dart';
import 'package:plaff_kebab/src/presentation/bloc/checkout/checkout_bloc.dart';
import 'package:plaff_kebab/src/presentation/components/material_border/material_border_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/widget/price_item_widget.dart';

class PriceWidget extends StatelessWidget {
  final num generalSum;
  final List<Products> listOfBasketProducts;
  final bool isCheckout;
  final String orderStatus;
  final num? sum;

  const PriceWidget({
    Key? key,
    this.sum,
    this.generalSum = 0,
    this.listOfBasketProducts = const [],
    this.isCheckout = false,
    this.orderStatus = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialBorderWidget(
      child: BlocSelector<CheckoutBloc, CheckoutState, int>(
          selector: (state) => state.shippingPrice,
          builder: (context, shippingPrice) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'check'.tr,
                ),
                AppUtils.kGap16,
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listOfBasketProducts.isNotEmpty
                      ? listOfBasketProducts.length
                      : 0,
                  itemBuilder: (context, index) {
                    return PriceItemWidget(
                      nameStyle: context.textStyle.smallLink
                          .copyWith(color: context.color.black3),
                      sumStyle: context.textStyle.smallLink
                          .copyWith(color: context.color.black3),
                      product: listOfBasketProducts[index],
                      countText:
                          '${listOfBasketProducts[index].quantity.moneyFormat} x ',
                      name: listOfBasketProducts[index]
                          .name
                          .getLocalizedDescription(),
                      discountSum:
                          '${(listOfBasketProducts[index].price + listOfBasketProducts[index].discounts).moneyFormat} ${'sum'.tr}',
                    );
                  },
                  separatorBuilder: (context, index) => Padding(
                    padding: AppUtils.kPaddingBottom8,
                    child: AppUtils.kDivider,
                  ),
                ),
                AppUtils.kGap12,
                BlocSelector<CheckoutBloc, CheckoutState, DeliveryType>(
                  selector: (state) => state.deliveryType,
                  builder: (context, state) {
                    return state == DeliveryType.delivery
                        ? PriceItemWidget(
                            nameStyle: context.textStyle.smallLink
                                .copyWith(color: context.color.black3),
                            sumStyle: context.textStyle.smallLink
                                .copyWith(color: context.color.black3),
                            name: 'shipping_amount'.tr,
                            discountSum:
                                '${shippingPrice.moneyFormat} ${'sum'.tr}',
                          )
                        : AppUtils.kBox;
                  },
                ),
                PriceItemWidget(
                  nameStyle: context.textStyle.regularBody
                      .copyWith(fontWeight: FontWeight.w500),
                  sumStyle: context.textStyle.regularBody
                      .copyWith(fontWeight: FontWeight.w500),
                  name: 'total_amount'.tr,
                  discountSum:
                      '${(generalSum + shippingPrice).moneyFormat} ${'sum'.tr}',
                  sum: sum?.toInt().toString(),
                ),
              ],
            );
          }),
    );
  }
}
