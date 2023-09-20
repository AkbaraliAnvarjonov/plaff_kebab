import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/components/bottom_sheet/time_bottom_sheet.dart';
import 'package:plaff_kebab/src/presentation/components/buttons/bottom_button.dart';

class DateTimeWidget extends StatelessWidget {
  final String title;
  final ValueChanged<DateTime> onDateTimeChanged;
  final bool isChooseTime;
  final DateTime? dateTime;
  final DateTime? initialDateTime;

  const DateTimeWidget({
    Key? key,
    required this.onDateTimeChanged,
    required this.title,
    this.isChooseTime = false,
    this.dateTime,
    this.initialDateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: AppUtils.kPaddingAll16,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Divider(height: 1),
          Flexible(
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: onDateTimeChanged,
              initialDateTime: isChooseTime
                  ? (dateTime ??
                      DateTime(DateTime.now().year, DateTime.now().month,
                          DateTime.now().day))
                  : DateTime(DateTime.now().year - 5, 12, 31),
              minimumDate: initialDateTime,
              maximumDate: isChooseTime
                  ? DateTime(2096, 12, 31)
                  : DateTime(DateTime.now().year - 5, 12, 31),
              backgroundColor: Colors.white,
            ),
          ),
          SafeArea(
            minimum: AppUtils.kPaddingAll16,
            child: BottomButton(
              onTap: () {
                Navigator.of(context).pop();
              },
              text: 'confirm'.tr,
            ),
          )
        ],
      ),
    );
  }
}
