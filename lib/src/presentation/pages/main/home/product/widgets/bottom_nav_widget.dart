import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/bloc/database/database_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/database/database_event.dart';
import 'package:plaff_kebab/src/presentation/bloc/product/product_bloc.dart';
import 'package:plaff_kebab/src/presentation/pages/main/home/product/widgets/plus_minus_button.dart';

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              if (int.parse(state.productIdModel!.count) > 1) {
                                BlocProvider.of<ProductBloc>(context).add(
                                    ChangeCount(
                                        status: state.productStatus,
                                        isPlus: false,
                                        productIdModel: state.productIdModel!));
                              }
                            },
                          ),
                          Padding(
                            padding: AppUtils.kPaddingHorizontal12,
                            child: Text(
                              state.productIdModel!.count,
                              style: context.textStyle.counterStyle,
                            ),
                          ),
                          PlusMinusButton(
                            onTap: () {
                              BlocProvider.of<ProductBloc>(context).add(
                                  ChangeCount(
                                      status: state.productStatus,
                                      isPlus: true,
                                      productIdModel: state.productIdModel!));
                            },
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Text(
                        "${state.productIdModel!.outPrice * int.parse(state.productIdModel!.count)} ${context.tr("sum")}"),
                  ],
                );
              },
            ),
            const Gap(8),
            BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  BlocProvider.of<DatabaseBloc>(context).add(AddProduct(
                      combo: state.combo,
                      modifier: state.modifiers,
                      product: state.productIdModel!));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 52),
                ),
                child: Text(
                  context.tr("add_card"),
                  style: context.textStyle.regularSubheadline.copyWith(
                      color: context.color.black, fontWeight: FontWeight.w600),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
