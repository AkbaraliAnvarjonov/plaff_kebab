import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    this.color,
    required this.text,
    required this.onTap,
  });
  final Color? color;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              color ?? context.colorScheme.primary),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: context.textStyle.appBarTitle,
        ),
      ),
    );
  }
}
