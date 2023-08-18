import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/extension/language_extension.dart';
import 'package:plaff_kebab/src/data/models/translations_model.dart';
import 'package:plaff_kebab/src/presentation/bloc/product/product_bloc.dart';
import 'package:plaff_kebab/src/presentation/components/material_border/material_border_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/product/widgets/bottom_nav_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/product/widgets/product_tile_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/product/widgets/sliver_app_bar.dart';

part 'mixin/product_mixin.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    super.key,
    required this.image,
    required this.description,
    required this.title,
  });
  final String image;
  final Translations title;
  final Translations description;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with TickerProviderStateMixin, ProductMixin {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
          backgroundColor: context.colorScheme.onSurface,
          body: CustomScrollView(
            controller: scrollController,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              SliverAppBarWidget(image: widget.image),
              ProductTitleWidget(
                title: widget.title,
                description: widget.description,
              ),
              const SliverGap(8),
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state.productStatus.isSuccess) {
                    // return SliverList(
                    //   delegate: SliverChildBuilderDelegate(
                    //     childCount: state.productIdModel!.properties.length,
                    //     (context, index) => ProductPropertiesWidget(
                    //       property: state.productIdModel!.properties[index],
                    //     ),
                    //   ),
                    // );
                  }
                  if (state.productStatus.getModifierSucces) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: state.modifiers.length,
                          (context, indexModifier) => MaterialBorderWidget(
                                  child: Column(
                                children: [
                                  Text(
                                    state.modifiers[indexModifier].name
                                        .getLocalizedDescription(),
                                  ),
                                  ListView.builder(
                                    itemCount: state.modifiers[indexModifier]
                                        .variants.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, indexVariant) =>
                                        ListTile(
                                      title: Text(state.modifiers[indexModifier]
                                          .variants[indexVariant].title
                                          .getLocalizedDescription()),
                                    ),
                                  )
                                ],
                              ))),
                    );
                  }
                  return const SliverToBoxAdapter(child: SizedBox());
                },
              )
            ],
          ),
          bottomNavigationBar: const BottomNavWidget()),
    );
  }
}
