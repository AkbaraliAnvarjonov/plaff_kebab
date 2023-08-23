import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/extension/language_extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/bloc/home/home_bloc.dart';
import 'package:plaff_kebab/src/presentation/components/material_border/material_border_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/home/widgets/banner_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/home/widgets/header_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/home/widgets/home_appbar.dart';
import 'package:plaff_kebab/src/presentation/pages/main/home/widgets/product_card_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/home/widgets/search_result_widget.dart';

part 'mixin/home_mixin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, HomeMixin {
  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          appBar: HomeAppBar(
            onChanged: (searchText) {
              bloc.add(SearchEvent(search: searchText));
            },
          ),
          backgroundColor: context.colorScheme.onSurface,
          body: BlocConsumer<HomeBloc, HomeState>(
            listenWhen: (previous, current) =>
                previous.isScrollingTop != current.isScrollingTop,
            listener: listener,
            builder: (context, state) {
              if (state.categoryStatus.isSuccess &&
                  state.searchStatus.isInitial) {
                return CustomScrollView(
                  controller: scrollController,
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  slivers: [
                    CategoryWidget(
                      categoryWithProductsList: state.categoryWithProductsList,
                      selectedList: state.selectedList,
                    ),
                    const BannerWidget(),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: state.categoryWithProductsList.length,
                        (context, index) {
                          if (state.selectedList.isEmpty ||
                              state.selectedList.contains(state
                                  .categoryWithProductsList[index].title.en)) {
                            return Padding(
                              padding: AppUtils.kPaddingBottom16,
                              child: MaterialBorderWidget(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.categoryWithProductsList[index]
                                          .title
                                          .getLocalizedDescription(),
                                      style: context.textStyle.bodyTitle3
                                          .copyWith(
                                              fontWeight: FontWeight.w600),
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
                                        color: context.color.black
                                            .withOpacity(0.1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ),
                  ],
                );
              }
              if (state.categoryStatus.isError || state.searchStatus.isError) {
                return Center(child: Text(state.error));
              }
              if (state.searchStatus.isSuccess) {
                return SearchResultWidget(searchProduct: state.searchProduct);
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      );
}
