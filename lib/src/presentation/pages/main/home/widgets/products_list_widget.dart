import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/extension/language_extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/bloc/home/home_bloc.dart';
import 'package:plaff_kebab/src/presentation/pages/main/home/widgets/product_card_widget.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: state.categoryWithProductsList.length,
            (context, index) {
              if (state.selectedList.isEmpty ||
                  state.selectedList.contains(
                      state.categoryWithProductsList[index].title.en)) {
                return Material(
                  color: context.theme.cardColor,
                  borderRadius: AppUtils.kBorderRadius12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: AppUtils.kPaddinTop16Left16,
                        child: Text(
                          state.categoryWithProductsList[index].title
                              .getLocalizedDescription(),
                          style: context.textStyle.bodyTitle3
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state
                            .categoryWithProductsList[index].products.length,
                        itemBuilder: (context, productIndex) =>
                            ProductCardWidget(
                          productModel: state.categoryWithProductsList[index]
                              .products[productIndex],
                        ),
                        separatorBuilder: (context, index) => Padding(
                          padding: AppUtils.kPaddingHorizontal16,
                          child: Divider(
                            height: 0.5,
                            color: context.color.black.withOpacity(0.1),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        );
      },
    );
  }
}
