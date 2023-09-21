import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';

class AboutServicePage extends StatelessWidget {
  const AboutServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('about_us'.tr)),
      body: Container(
        margin: AppUtils.kPaddingAll12,
        padding: AppUtils.kPaddingAll12,
        decoration: BoxDecoration(
          borderRadius: AppUtils.kBorderRadius12,
          color: context.color.cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "About us and etc",
              style: context.textStyle.smallLink,
            ),
          ],
        ),
      ),
    );
  }
}
