import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';

class OrderEmptyWidget extends StatelessWidget {
  const OrderEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.bag,
            height: 104,
            width: 104,
          ),
          AppUtils.kGap24,
          Text(
            context.tr("empty"),
            style: context.textStyle.regularSubheadline,
          )
        ],
      ),
    );
  }
}
