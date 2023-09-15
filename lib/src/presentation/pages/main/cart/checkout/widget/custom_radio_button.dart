import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/widget/radio_button_checked.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    Key? key,
    required this.isChecked,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final bool isChecked;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: AppUtils.kPaddingVertical8,
        child: Row(
          children: [
            RadioButtonChecked(
              isChecked: isChecked,
              size: 20,
            ),
            AppUtils.kGap8,
            Expanded(child: Text(title))
          ],
        ),
      ),
    );
  }
}
