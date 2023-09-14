import 'package:flutter/widgets.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/extension/language_extension.dart';
import 'package:plaff_kebab/src/data/source/hive/product.dart';

class ModifiersNameWidget extends StatelessWidget {
  const ModifiersNameWidget({super.key, required this.products});
  final Products products;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: products.modifiers.map(
        (modifier) {
          return Text(
            "${modifier.modifierName.getLocalizedDescription()} (${modifier.modifierQuantity}x)",
            style: context.textStyle.regularFootnote
                .copyWith(color: context.color.black3),
          );
        },
      ).toList(),
    );
  }
}
