// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/extension/language_extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/data/models/category/category_with_products_model.dart';
import 'package:plaff_kebab/src/presentation/bloc/home/home_bloc.dart';

class AnimatedConWidget extends StatefulWidget {
  AnimatedConWidget({
    super.key,
    required this.categoryWithProducts,
    required this.isTapped,
    required this.listCategory,
    required this.selectedList,
  });
  bool isTapped;
  final CategoryWithProducts categoryWithProducts;
  List<String> selectedList;
  List<CategoryWithProducts> listCategory;

  @override
  State<AnimatedConWidget> createState() => _AnimatedConWidgetState();
}

class _AnimatedConWidgetState extends State<AnimatedConWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.isTapped
            ? widget.selectedList.remove(widget.categoryWithProducts.title.en)
            : widget.selectedList.add(widget.categoryWithProducts.title.en);
        widget.isTapped = !widget.isTapped;

        BlocProvider.of<HomeBloc>(context).add(CategorySelectEvent(
            selectedList: widget.selectedList,
            categoryWithProductsList: widget.listCategory));
        setState(() {});
      },
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: widget.isTapped
              ? context.colorScheme.primary
              : context.colorScheme.onSurface,
          borderRadius: AppUtils.kBorderRadius8,
        ),
        duration: const Duration(milliseconds: 100),
        child: Center(
          child: Padding(
            padding: AppUtils.kPaddingHorizontal16,
            child: Text(
              widget.categoryWithProducts.title.getLocalizedDescription(),
              style: context.textStyle.style15Wight400,
            ),
          ),
        ),
      ),
    );
  }
}
