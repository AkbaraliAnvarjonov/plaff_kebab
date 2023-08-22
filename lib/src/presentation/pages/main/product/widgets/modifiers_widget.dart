import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/extension/language_extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/bloc/product/product_bloc.dart';
import 'package:plaff_kebab/src/presentation/components/material_border/material_border_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/product/widgets/plus_minus_button.dart';

class ModifiersWidget extends StatelessWidget {
  const ModifiersWidget({
    super.key,
    required this.indexModifier,
  });
  final int indexModifier;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return MaterialBorderWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.modifiers[indexModifier].name.getLocalizedDescription(),
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.modifiers[indexModifier].variants.length,
                shrinkWrap: true,
                itemBuilder: (context, indexVariant) {
                  int count = int.parse(state
                      .modifiers[indexModifier].variants[indexVariant].count);
                  return Padding(
                    padding: AppUtils.kPaddingVer8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              count == 0
                                  ? AppIcons.empty_icon
                                  : AppIcons.check_icon,
                              height: 20,
                              width: 20,
                            ),
                            const Gap(12),
                            Text(
                              state.modifiers[indexModifier]
                                  .variants[indexVariant].title
                                  .getLocalizedDescription(),
                              style: context.textStyle.regularSubheadline
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),
                            const Spacer(),
                            Text(
                              "${state.modifiers[indexModifier].variants[indexVariant].outPrice} ${context.tr("sum")}",
                              style: context.textStyle.regularSubheadline
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: context.color.black3),
                            )
                          ],
                        ),
                        const Gap(4),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: context.color.cardColor,
                                borderRadius: AppUtils.kBorderRadius12,
                                border: Border.all(
                                  color: context.colorScheme.background,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  PlusMinusButton(
                                    isMinus: true,
                                    onTap: () {
                                      if (count > 0) {
                                        count--;
                                        state
                                            .modifiers[indexModifier]
                                            .variants[indexVariant]
                                            .count = count.toString();
                                        BlocProvider.of<ProductBloc>(context)
                                            .add(
                                          PriceChange(
                                            price: state
                                                .modifiers[indexModifier]
                                                .variants[indexVariant]
                                                .outPrice,
                                            isPlus: false,
                                            productIdModel:
                                                state.productIdModel!,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                  Padding(
                                    padding: AppUtils.kPaddingHorizontal12,
                                    child: Text(
                                      state.modifiers[indexModifier]
                                          .variants[indexVariant].count,
                                      style: context.textStyle.counterStyle,
                                    ),
                                  ),
                                  PlusMinusButton(
                                    onTap: () {
                                      count++;
                                      state
                                          .modifiers[indexModifier]
                                          .variants[indexVariant]
                                          .count = count.toString();
                                      BlocProvider.of<ProductBloc>(context).add(
                                        PriceChange(
                                          price: state.modifiers[indexModifier]
                                              .variants[indexVariant].outPrice,
                                          isPlus: true,
                                          productIdModel: state.productIdModel!,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  color: context.color.black.withOpacity(0.1),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
