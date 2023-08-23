import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/data/source/hive/product.dart';
import 'package:plaff_kebab/src/presentation/bloc/database/database_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/database/database_event.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({super.key, required this.products});
  final Products products;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.tr("warning")),
      content: Text(context.tr("is_delete")),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(context.tr('no')),
        ),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<DatabaseBloc>(context)
                .add(UpdateProduct(products, isMinus: true, isDelete: true));
            Navigator.pop(context);
          },
          child: Text(context.tr('yes')),
        )
      ],
    );
  }
}
