import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/extension/language_extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/data/source/hive/product.dart';

class PriceItemWidget extends StatelessWidget {
  final String? name;
  final String discountSum;
  final String countText;
  final TextStyle nameStyle;
  final TextStyle sumStyle;
  final Products? product;
  final String? sum;
  final String? sumDiscount;

  const PriceItemWidget({
    Key? key,
    this.name,
    required this.discountSum,
    this.countText = '',
    required this.nameStyle,
    required this.sumStyle,
    this.product,
    this.sum,
    this.sumDiscount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(name.toString(), style: nameStyle)),
            RichText(
              text: TextSpan(
                style: sumStyle,
                children: [
                  if (sum != null && sumDiscount != null) ...[
                    TextSpan(
                      text: '$sumDiscount  ',
                      style: context.textStyle.smallLink
                          .copyWith(color: context.color.black),
                    ),
                    TextSpan(
                      text: sum,
                      style: context.textStyle.smallLink.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    TextSpan(
                      text: ' ${'sum'.tr}',
                      style: context.textStyle.smallLink
                          .copyWith(color: context.color.black3),
                    ),
                  ] else ...[
                    TextSpan(
                      text: countText,
                      style: context.textStyle.smallLink
                          .copyWith(color: context.color.black3),
                    ),
                    TextSpan(
                      text: discountSum,
                      style: context.textStyle.smallLink
                          .copyWith(color: context.color.black3),
                    ),
                  ]
                ],
              ),
            ),
          ],
        ),
        Visibility(
          visible: product?.combos.isNotEmpty ?? false,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: product?.combos.length ?? 0,
            itemBuilder: (ctx, i) {
              return Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 12),
                child: RichText(
                  text: TextSpan(
                    text: product?.combos[i].variantName
                            .getLocalizedDescription() ??
                        '',
                    style: context.textStyle.smallLink
                        .copyWith(color: context.color.black3),
                  ),
                ),
              );
            },
          ),
        ),
        Visibility(
          visible: product?.modifiers.isNotEmpty ?? true,
          child: Column(
            children: [
              AppUtils.kGap12,
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: product?.modifiers.length ?? 0,
                itemBuilder: (ctx, i) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product?.modifiers[i].modifierName
                                .getLocalizedDescription() ??
                            '',
                        style: context.textStyle.smallLink
                            .copyWith(color: context.color.black3),
                      ),
                      RichText(
                        text: TextSpan(
                          // text: BaseFunctions.getTransLanguage(
                          //     product?.modifiers?[i].modifierName ?? ''),
                          style: context.textStyle.smallLink
                              .copyWith(color: context.color.black3),
                          children: [
                            TextSpan(
                                text:
                                    '${product?.modifiers[i].modifierQuantity.toString() ?? ''} x ',
                                style: context.textStyle.smallLink
                                    .copyWith(color: context.color.black3)),
                            TextSpan(
                                text:
                                    '${(product?.modifiers[i].addModifierPrice ?? true) ? '0' : (product?.modifiers[i].modifiersPrice ?? '0')} ${'sum'.tr}',
                                style: context.textStyle.smallLink
                                    .copyWith(color: context.color.black3)),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        AppUtils.kGap6,
      ],
    );
  }
}
