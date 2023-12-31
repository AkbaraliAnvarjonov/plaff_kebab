import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';

class MaterialBorderWidget extends StatelessWidget {
  const MaterialBorderWidget({super.key, required this.child, this.padding});
  final Widget child;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: AppUtils.kBorderRadius12,
      color: context.color.cardColor,
      child: Padding(
        padding: padding ?? AppUtils.kPaddingAll16,
        child: child,
      ),
    );
  }
}
