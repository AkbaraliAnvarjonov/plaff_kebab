import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';

class CircleItemSvgWidget extends StatelessWidget {
  final bool status;
  final String assets;

  const CircleItemSvgWidget({
    Key? key,
    this.status = true,
    required this.assets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          color: status
              ? context.colorScheme.primary
              : context.colorScheme.onSurface,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            assets,
            height: 24,
            width: 24,
            color:
                status ? context.color.cardColor : context.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
