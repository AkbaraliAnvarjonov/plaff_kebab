import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';

class RadioButtonChecked extends StatelessWidget {
  final double size;
  final bool isChecked;

  const RadioButtonChecked({
    Key? key,
    this.size = 24,
    required this.isChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        children: [
          AnimatedPositioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            duration: const Duration(milliseconds: 250),
            child: CircleAvatar(
              radius: size / 2,
              backgroundColor: isChecked
                  ? context.colorScheme.primary
                  : context.color.cardColor,
            ),
          ),
          AnimatedPositioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            duration: const Duration(milliseconds: 250),
            child: Center(
              child: CircleAvatar(
                radius: isChecked ? size / 4.5 : (size / 2.5),
                backgroundColor: isChecked
                    ? context.color.cardColor
                    : const Color(0xffF9F9F9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RadioButtonCheckChecked extends StatelessWidget {
  final double size;
  final bool isChecked;

  const RadioButtonCheckChecked({
    Key? key,
    this.size = 24,
    required this.isChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        children: [
          AnimatedPositioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            duration: const Duration(milliseconds: 250),
            child: CircleAvatar(
              radius: size / 2,
              backgroundColor: isChecked
                  ? context.colorScheme.primary
                  : context.color.cardColor,
            ),
          ),
          if (!isChecked)
            Positioned.fill(
              child: Center(
                child: CircleAvatar(
                  radius: isChecked ? size / 4 : (size / 2.5),
                  backgroundColor: isChecked
                      ? context.color.cardColor
                      : context.colorScheme.background,
                ),
              ),
            ),
          if (isChecked)
            Positioned.fill(
              child: Center(
                child: Icon(
                  Icons.check_outlined,
                  color: context.color.cardColor,
                  size: size - 4,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
