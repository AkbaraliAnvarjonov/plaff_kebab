import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';

class OrderStatusWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color color;

  const OrderStatusWidget({
    Key? key,
    required this.textColor,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: AppUtils.kBorderRadius12,
      color: Colors.transparent,
      child: Ink(
        padding: AppUtils.kPaddingAll16,
        decoration: BoxDecoration(
          borderRadius: AppUtils.kBorderRadius12,
          color: color,
        ),
        child: Semantics(
          child: Text(
            text,
            semanticsLabel: '',
            style: TextStyle(fontSize: 15, color: textColor),
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
