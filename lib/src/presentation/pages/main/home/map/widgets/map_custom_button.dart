import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';

class MapCustomButton extends StatelessWidget {
  final String icon;
  final Function()? onTap;
  final EdgeInsets? margin;

  const MapCustomButton({Key? key, required this.icon, this.onTap, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppUtils.kPaddingAll16,
      child: InkWell(
        borderRadius: AppUtils.kBorderRadius12,
        onTap: onTap,
        child: Container(
          height: 35,
          width: 35,
          padding: AppUtils.kPaddingAll8,
          decoration: BoxDecoration(
              borderRadius: AppUtils.kBorderRadius12,
              color: context.color.cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: SvgPicture.asset(
              icon,
              height: 20,
              width: 20,
            ),
            onPressed: onTap,
            iconSize: 20,
            splashRadius: 20,
          ),
        ),
      ),
    );
  }
}
