import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/components/bouncing_widget/bouncing_widget.dart';

class PlusMinusButton extends StatelessWidget {
  final Function() onTap;
  final bool isMinus;
  final double size;
  final Color? backgroundColor;
  final Color? iconColor;
  final BorderRadius? borderRadius;
  final bool isDisable;

  const PlusMinusButton({
    Key? key,
    required this.onTap,
    this.isDisable = false,
    this.isMinus = false,
    this.size = 44,
    this.backgroundColor,
    this.iconColor,
    this.borderRadius = AppUtils.kBorderRadius12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      onPressed: onTap,
      duration: const Duration(milliseconds: 100),
      scaleFactor: 1.8,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: Colors.transparent,
        ),
        child: Center(
          child: Icon(
            isMinus ? Icons.remove : Icons.add,
            color: isDisable
                ? context.color.black3
                : (iconColor ?? context.color.black),
          ),
        ),
      ),
    );
  }
}
