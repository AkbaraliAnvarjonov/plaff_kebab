import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';

class ContainerStatusWidget extends StatelessWidget {
  final bool status;

  const ContainerStatusWidget({
    Key? key,
    this.status = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      decoration: BoxDecoration(
        color: status
            ? context.colorScheme.primary
            : context.colorScheme.onSurface,
      ),
    );
  }
}
