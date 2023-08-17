import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/data/models/category/category_with_products_model.dart';
import 'package:plaff_kebab/src/presentation/pages/main/home/widgets/animated_container.dart';

// ignore: must_be_immutable
class CategoryWidget extends StatelessWidget {
  CategoryWidget({
    super.key,
    required this.categoryWithProductsList,
    required this.selectedList,
  });
  final List<CategoryWithProducts> categoryWithProductsList;
  List<String> selectedList;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Material(
        color: context.color.cardColor,
        child: SizedBox(
          height: 72,
          child: ListView.separated(
            itemCount: categoryWithProductsList.length,
            padding: AppUtils.kPaddingAll16,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return AnimatedConWidget(
                categoryWithProducts: categoryWithProductsList[index],
                isTapped: false,
                listCategory: categoryWithProductsList,
                selectedList: selectedList,
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Gap(8),
          ),
        ),
      ),
    );
  }
}
