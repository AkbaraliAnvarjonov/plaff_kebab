import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:plaff_kebab/src/core/constants/constants.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/extension/language_extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/data/models/category/description_model.dart';
import 'package:plaff_kebab/src/presentation/bloc/product/product_bloc.dart';

part 'mixin/product_mixin.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    super.key,
    required this.image,
    required this.description,
    required this.title,
  });
  final String image;
  final Description title;
  final Description description;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with TickerProviderStateMixin, ProductMixin {
  @override
  Widget build(BuildContext context) {
    print(widget.image);
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
            SliverAppBar(
              actions: [
                Padding(
                  padding: AppUtils.kPaddingAll8,
                  child: CircleAvatar(
                    backgroundColor: context.color.cardColor.withOpacity(0.8),
                    radius: 18,
                    child: IconButton(
                      icon: SvgPicture.asset(AppIcons.share_icon,
                          width: 24, height: 24),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
              leading: Padding(
                padding: AppUtils.kPaddingAll8,
                child: CircleAvatar(
                  backgroundColor: context.color.cardColor.withOpacity(0.8),
                  radius: 18,
                  child: IconButton(
                    icon: SvgPicture.asset(AppIcons.back_row,
                        width: 24, height: 24),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              expandedHeight: 206,
              flexibleSpace: CachedNetworkImage(
                imageUrl: Constants.imageUrl + widget.image,
                color: context.colorScheme.onSurface,
                errorWidget: (context, url, error) => SizedBox(
                  child: SvgPicture.asset(
                    AppIcons.dish,
                    height: 30,
                    width: 45,
                  ),
                ),
                placeholder: (context, url) => SizedBox(
                  child: SvgPicture.asset(
                    AppIcons.dish,
                    height: 30,
                    width: 45,
                  ),
                ),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 240,
              ),
            ),
            SliverToBoxAdapter(
              child: Material(
                borderRadius: AppUtils.kBorderRadius12,
                color: context.color.cardColor,
                child: Padding(
                  padding: AppUtils.kPaddingAll16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title.getLocalizedDescription(),
                        style: context.textStyle.bodyTitle3
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      const Gap(12),
                      Text(
                        widget.description.getLocalizedDescription(),
                        style: context.textStyle.regularFootnote
                            .copyWith(color: context.color.black3),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state.productStatus.isSuccess) {
                  return SliverToBoxAdapter(
                      child: ListView.builder(
                    itemCount: state.productIdModel!.properties.length,
                    itemBuilder: (context, index) => Text(state
                        .productIdModel!.properties[index].title
                        .getLocalizedDescription()),
                  ));
                }
                return const SliverToBoxAdapter(child: SizedBox());
              },
            )
          ],
        ),
        bottomNavigationBar: Material(
          color: context.color.cardColor,
          child: Padding(
            padding: AppUtils.kPaddingAll16,
            child: SizedBox(
              height: 50,
              child: Column(
                children: [
                  const LinearProgressIndicator(
                    minHeight: 2,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      context.tr("add_card"),
                      style: context.textStyle.regularSubheadline.copyWith(
                          color: context.color.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
