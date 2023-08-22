import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/bloc/product/product_bloc.dart';
import 'package:plaff_kebab/src/presentation/pages/main/product/widgets/plus_minus_button.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.color.cardColor,
      child: Padding(
        padding: AppUtils.kPaddingAll16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state.productStatus.isLoading) {
                  return const LinearProgressIndicator(
                    minHeight: 2,
                  );
                }
                return Row(
                  key: ValueKey(state.productIdModel!.outPrice),
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: DecoratedBox(
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
                              onTap: () {},
                            ),
                            Padding(
                              padding: AppUtils.kPaddingHorizontal12,
                              child: Text(
                                state.productIdModel!.count,
                                style: context.textStyle.counterStyle,
                              ),
                            ),
                            PlusMinusButton(
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(state.productIdModel!.outPrice.toString()),
                  ],
                );
              },
            ),
            const Gap(8),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 52),
              ),
              child: Text(
                context.tr("add_card"),
                style: context.textStyle.regularSubheadline.copyWith(
                    color: context.color.black, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
