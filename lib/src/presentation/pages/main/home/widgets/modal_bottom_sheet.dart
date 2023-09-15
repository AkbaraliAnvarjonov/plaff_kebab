import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/config/router/app_routes.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/data/models/adress/adress_model.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({
    super.key,
    required this.state,
  });
  final List<CustomerAddress> state;

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    int selectRadioValue = 0;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppUtils.kPaddingBottom8Hor16top16,
          child: Text(
            context.tr("my_adresses"),
            style: context.textStyle.appBarTitle,
          ),
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.state.length,
          itemBuilder: (context, index) => ListTile(
            onTap: () {
              selectRadioValue = index;
              setState(() {});
            },
            leading: SizedBox(
              width: 20,
              child: Radio(
                value: index,
                groupValue: selectRadioValue,
                onChanged: (value) {
                  selectRadioValue = value!;
                },
              ),
            ),
            title: Text(
              widget.state[index].name,
              style: context.textStyle.regularSubheadline
                  .copyWith(color: context.color.black3),
            ),
            subtitle: Text(
              widget.state[index].address,
              style: context.textStyle.subHead14Weight400,
            ),
          ),
          separatorBuilder: (BuildContext context, int index) => Padding(
            padding: AppUtils.kPaddingHorizontal16,
            child: Divider(
              color: context.color.black5.withOpacity(0.1),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: AppUtils.kPaddingAll16,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  context.color.black5.withOpacity(0.3),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.map);
              },
              child: Text(
                context.tr("add_location"),
                style: context.textStyle.appBarTitle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
