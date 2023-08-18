import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/extension/language_extension.dart';
import 'package:plaff_kebab/src/data/models/translations_model.dart';
import 'package:plaff_kebab/src/presentation/components/material_border/material_border_widget.dart';

class ProductTitleWidget extends StatelessWidget {
  const ProductTitleWidget(
      {super.key, required this.title, required this.description});
  final Translations title;
  final Translations description;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: MaterialBorderWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.getLocalizedDescription(),
              style: context.textStyle.bodyTitle3
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const Gap(12),
            Text(
              description.getLocalizedDescription(),
              style: context.textStyle.regularFootnote
                  .copyWith(color: context.color.black3),
            ),
          ],
        ),
      ),
    );
  }
}
