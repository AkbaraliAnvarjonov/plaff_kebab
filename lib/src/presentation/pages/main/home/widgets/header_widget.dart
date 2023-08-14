import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/data/models/category/category_with_products_model.dart';
import 'package:plaff_kebab/src/presentation/components/cards/cards.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.categoryWithProductsList});
  final List<CategoryWithProducts> categoryWithProductsList;

  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
      sliver: SliverToBoxAdapter(
        child: Material(
          color: context.color.cardColor,
          child: Column(
            children: [
              Padding(
                padding: AppUtils.kPaddingHorizontal16,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 12),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.location_icon,
                        width: 20,
                        height: 20,
                      ),
                      const Gap(6),
                      Text(
                        "Массив Бешягач 19/30",
                        style: context.textStyle.regularSubheadline,
                      ),
                      const Gap(6),
                      SvgPicture.asset(
                        AppIcons.bottom_arrow,
                        width: 20,
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: AppUtils.kPaddingHorizontal16,
                child: SearchBar(
                  shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
                    (Set<MaterialState> states) => const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                  elevation: MaterialStateProperty.resolveWith<double?>(
                      (Set<MaterialState> states) => 0.5),
                  surfaceTintColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) =>
                          context.colorScheme.onSurface),
                  leading: Padding(
                      padding: AppUtils.kPaddingSearch,
                      child: SvgPicture.asset(
                        AppIcons.search_icon,
                        width: 20,
                        height: 20,
                      )),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) =>
                          context.colorScheme.onSurface),
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) =>
                          context.colorScheme.onSurface),
                  hintText: context.tr("search"),
                  hintStyle: MaterialStateProperty.resolveWith<TextStyle?>(
                      (Set<MaterialState> states) => context
                          .textStyle.regularSubheadline
                          .copyWith(color: context.color.black5)),
                  textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
                      (Set<MaterialState> states) =>
                          context.textStyle.regularSubheadline),
                ),
              ),
              SizedBox(
                height: 72,
                child: ListView.separated(
                  itemCount: categoryWithProductsList.length,
                  padding: AppUtils.kPaddingAll16,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Cards(
                    color: context.colorScheme.onSurface,
                    child: Padding(
                      padding: AppUtils.kPaddingHor16Ver10,
                      child: Text(categoryWithProductsList[index].title.uz),
                    ),
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      const Gap(8),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
