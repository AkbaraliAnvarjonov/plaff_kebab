import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(context.tr('favorites')),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.favourite,
                height: 104,
                width: 104,
              ),
              AppUtils.kGap24,
              Text(
                context.tr("empty_adress"),
                style: context.textStyle.regularSubheadline,
              )
            ],
          ),
        ),
      );
}
