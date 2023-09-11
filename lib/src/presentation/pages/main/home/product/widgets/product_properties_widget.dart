import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/extension/language_extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/data/models/product/property_model.dart';
import 'package:plaff_kebab/src/presentation/components/material_border/material_border_widget.dart';

// ignore: must_be_immutable
class ProductPropertiesWidget extends StatefulWidget {
  ProductPropertiesWidget({super.key, required this.property});
  final Property property;
  int selectRadioValue = 0;

  @override
  State<ProductPropertiesWidget> createState() =>
      _ProductPropertiesWidgetState();
}

class _ProductPropertiesWidgetState extends State<ProductPropertiesWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppUtils.kPaddingVer8,
      child: MaterialBorderWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.property.title.getLocalizedDescription()),
            const Gap(12),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Row(
                      children: [
                        Radio(
                          value: index,
                          groupValue: widget.selectRadioValue,
                          onChanged: (value) {
                            widget.selectRadioValue = value!;
                            setState(() {});
                          },
                        ),
                        Text(
                          widget.property.options[index].title
                              .getLocalizedDescription(),
                          style: context.textStyle.subHead14Weight400,
                        )
                      ],
                    ),
                separatorBuilder: (context, index) => Divider(
                      color: context.color.black.withOpacity(0.1),
                    ),
                itemCount: widget.property.options.length)
          ],
        ),
      ),
    );
  }
}
