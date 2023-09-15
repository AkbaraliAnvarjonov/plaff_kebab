import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/widget/radio_button_checked.dart';

class CheckOrderItemWidget extends StatelessWidget {
  final bool checked;
  final Function()? onTap;
  final String text;
  final String assets;
  final double height;
  final Widget child;
  final Widget? rightChild;

  const CheckOrderItemWidget({
    Key? key,
    this.checked = false,
    this.onTap,
    required this.text,
    required this.assets,
    this.height = 56,
    this.child = const SizedBox(),
    this.rightChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.color.cardColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: onTap,
            child: Ink(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 14,
                      bottom: 14,
                      right: 12,
                      left: 12,
                    ),
                    child: Ink(
                      height: 28,
                      width: 40,
                      padding: AppUtils.kPaddingAll6,
                      child: Image.asset(
                        'assets/png/$assets.png',
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      text,
                    ),
                  ),
                  height != 64
                      ? Padding(
                          padding: AppUtils.kPaddingAll16,
                          child: RadioButtonChecked(
                            isChecked: checked,
                            size: 20,
                          ),
                        )
                      : rightChild ?? AppUtils.kBox,
                ],
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
