import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plaff_kebab/src/config/router/app_routes.dart';
import 'package:plaff_kebab/src/core/constants/constants.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/extension/language_extension.dart';
import 'package:plaff_kebab/src/data/models/product/search_product/search_product.dart';
import 'package:plaff_kebab/src/data/models/screen_args/product_page_args.dart';
import 'package:plaff_kebab/src/presentation/bloc/product/product_bloc.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({
    super.key,
    required this.searchProduct,
  });
  final List<SearchProduct> searchProduct;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      slivers: [
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) => ListTile(
            leading: CachedNetworkImage(
              imageUrl: Constants.imageUrl + searchProduct[index].image,
              placeholder: (context, url) => SvgPicture.asset(
                AppIcons.dish,
                height: 40,
                width: 40,
              ),
              errorWidget: (context, url, error) => SvgPicture.asset(
                AppIcons.dish,
                height: 40,
                width: 40,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.product,
                arguments: ProductArgs(
                  image: searchProduct[index].image,
                  description: searchProduct[index].description,
                  title: searchProduct[index].title,
                ),
              );
              BlocProvider.of<ProductBloc>(context)
                  .add(GetProductEvent(id: searchProduct[index].id));
            },
            title: Text(
              searchProduct[index].title.getLocalizedDescription(),
              style: context.textStyle.regularSubheadline,
            ),
          ),
          childCount: searchProduct.length,
        ))
      ],
    );
  }
}
