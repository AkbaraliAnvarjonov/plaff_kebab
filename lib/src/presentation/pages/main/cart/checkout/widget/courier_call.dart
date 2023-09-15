import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/components/material_border/material_border_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/widget/custom_radio_button.dart';

// ignore: must_be_immutable
class CourierCallWidget extends StatefulWidget {
  CourierCallWidget({super.key});
  bool isCall = true;
  @override
  State<CourierCallWidget> createState() => _CourierCallWidgetState();
}

class _CourierCallWidgetState extends State<CourierCallWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialBorderWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'call_status_text'.tr,
          ),
          AppUtils.kGap16,
          CustomRadioButton(
            isChecked: widget.isCall,
            title: 'yes'.tr,
            onTap: () {
              widget.isCall = true;
              setState(() {});
            },
          ),
          AppUtils.kGap12,
          AppUtils.kDivider,
          AppUtils.kGap12,
          CustomRadioButton(
            isChecked: !widget.isCall,
            title: 'no'.tr,
            onTap: () {
              widget.isCall = false;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
