import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';

class CustomBottomSheet extends StatelessWidget {
  final Widget child;
  final EdgeInsets? contentPadding;

  const CustomBottomSheet({
    Key? key,
    this.contentPadding,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              margin: AppUtils.kPaddingVer12,
              width: 50,
              height: 5,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: AppUtils.kBorderRadius8,
              ),
            ),
          ),
          Flexible(
            child: ClipRRect(
              borderRadius: AppUtils.kBorderTopRadius10,
              child: Material(
                color: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: AppUtils.kBorderTopRadius10,
                ),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
