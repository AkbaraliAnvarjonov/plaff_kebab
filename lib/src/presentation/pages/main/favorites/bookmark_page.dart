import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(context.tr('favorites')),
        ),
      );
}