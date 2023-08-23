import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/extension/language_extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/bloc/product/product_bloc.dart';
import 'package:plaff_kebab/src/presentation/components/material_border/material_border_widget.dart';

class ComboWidget extends StatefulWidget {
  const ComboWidget({
    super.key,
    required this.indexCombo,
  });
  final int indexCombo;

  @override
  State<ComboWidget> createState() => _ComboWidgetState();
}

class _ComboWidgetState extends State<ComboWidget> {
  int selectRadioValue = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      return Padding(
        padding: AppUtils.kPaddingVer8,
        child: MaterialBorderWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.combo[widget.indexCombo].title.getLocalizedDescription(),
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.combo[widget.indexCombo].variants.length,
                shrinkWrap: true,
                itemBuilder: (context, indexVariant) => Row(
                  children: [
                    Radio(
                      value: indexVariant,
                      groupValue: selectRadioValue,
                      onChanged: (value) {
                        selectRadioValue = value!;
                        setState(() {});
                      },
                    ),
                    Text(
                      state
                          .combo[widget.indexCombo].variants[indexVariant].title
                          .getLocalizedDescription(),
                      style: context.textStyle.regularSubheadline
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                separatorBuilder: (context, index) => Divider(
                  color: context.color.black.withOpacity(0.1),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}


//  Row(
//                     children: [
                      
//                       const Gap(12),
//                       Text(
//                         state.combo[indexCombo].variants[indexVariant].title
//                             .getLocalizedDescription(),
//                         style: context.textStyle.regularSubheadline
//                             .copyWith(fontWeight: FontWeight.w400),
//                       ),
//                       const Spacer(),
//                       Text(
//                         "${state.combo[indexCombo].variants[indexVariant].outPrice} ${context.tr("sum")}",
//                         style: context.textStyle.regularSubheadline
//                             .copyWith(
//                                 fontWeight: FontWeight.w400,
//                                 color: context.color.black3),
//                       )
//                     ],
//                   ),
              