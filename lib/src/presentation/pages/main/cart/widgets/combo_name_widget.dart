import 'package:flutter/widgets.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/extension/language_extension.dart';
import 'package:plaff_kebab/src/data/source/hive/product.dart';

class ComboNameWidget extends StatelessWidget {
  const ComboNameWidget({super.key, required this.products});
  final Products products;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: products.combos.map(
        (combo) {
          return Text(
            combo.variantName.getLocalizedDescription(),
            style: context.textStyle.regularFootnote
                .copyWith(color: context.color.black3),
          );
        },
      ).toList(),
    );
  }
}
