// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/extension/language_extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/data/models/category/category_with_products_model.dart';

class AnimatedConWidget extends StatefulWidget {
  AnimatedConWidget(
      {super.key, required this.categoryWithProducts, required this.isTapped});
  bool isTapped;
  final CategoryWithProducts categoryWithProducts;

  @override
  State<AnimatedConWidget> createState() => _AnimatedConWidgetState();
}

class _AnimatedConWidgetState extends State<AnimatedConWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.isTapped = !widget.isTapped;
        setState(() {});
      },
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: widget.isTapped
              ? context.colorScheme.primary
              : context.colorScheme.onSurface,
          borderRadius: AppUtils.kBorderRadius8,
        ),
        duration: const Duration(milliseconds: 200),
        child: Padding(
          padding: AppUtils.kPaddingHor16Ver10,
          child:
              Text(widget.categoryWithProducts.title.getLocalizedDescription()),
        ),
      ),
    );
  }
}
