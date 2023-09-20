import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/components/bottom_sheet/time_bottom_sheet.dart';
import 'package:plaff_kebab/src/presentation/components/buttons/bottom_button.dart';

class TimeWidget extends StatelessWidget {
  final String title;
  final ValueChanged<DateTime> onDateTimeChanged;
  final DateTime? currentTime;
  final VoidCallback? onConfirm;
  const TimeWidget({
    Key? key,
    required this.onDateTimeChanged,
    required this.title,
    this.currentTime,
    this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: title.isNotEmpty,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Flexible(
            child: CupertinoDatePicker(
              use24hFormat: true,
              mode: CupertinoDatePickerMode.time,
              onDateTimeChanged: onDateTimeChanged,
              initialDateTime: currentTime ?? DateTime.now(),
              backgroundColor: Colors.white,
            ),
          ),
          SafeArea(
            minimum: AppUtils.kPaddingAll12,
            child: BottomButton(
              onTap: () {
                onConfirm?.call();
              },
              text: 'confirm'.tr,
            ),
          )
        ],
      ),
    );
  }
}
