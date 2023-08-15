import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/bloc/category/category_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/main/home/home_bloc.dart';
import 'package:plaff_kebab/src/presentation/pages/main/home/widgets/banner_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/home/widgets/header_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/home/widgets/product_card_widget.dart';

part 'mixin/home_mixin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, HomeMixin {
  @override
  Widget build(BuildContext context) => BlocListener<HomeBloc, HomeState>(
        listenWhen: (previous, current) =>
            previous.isScrollingTop != current.isScrollingTop,
        listener: listener,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: Scaffold(
            backgroundColor: context.colorScheme.onSurface,
            body: BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
              if (state is GetCategorySuccesState) {
                return CustomScrollView(
                  controller: scrollController,
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  slivers: [
                    HeaderWidget(
                        categoryWithProductsList:
                            state.categoryWithProductsList, onTap: () {
                              
                            },),
                    const BannerWidget(),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: state.categoryWithProductsList.length,
                        (context, index) => Padding(
                          padding: AppUtils.kPaddingBottom16,
                          child: Material(
                            color: context.color.cardColor,
                            borderRadius: AppUtils.kBorderRadius12,
                            child: Padding(
                              padding: AppUtils.kPaddingAll16,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    state.categoryWithProductsList[index].title
                                        .uz,
                                    style: context.textStyle.bodyTitle3
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: state
                                        .categoryWithProductsList[index]
                                        .products
                                        .length,
                                    itemBuilder: (context, productIndex) =>
                                        ProductCardWidget(
                                      productModel: state
                                          .categoryWithProductsList[index]
                                          .products[productIndex],
                                    ),
                                    separatorBuilder: (context, index) =>
                                        Divider(
                                      height: 1,
                                      color:
                                          context.color.black.withOpacity(0.1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              if (state is GetCategoryErrosState) {
                return Center(child: Text(state.error));
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
          ),
        ),
      );
}
