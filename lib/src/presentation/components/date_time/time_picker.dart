import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/presentation/components/bottom_sheet/time_widget.dart';
import 'package:plaff_kebab/src/presentation/components/date_time/date_time_widget.dart';

class TimePicker {
  static Future<void> showDatePicker(
    BuildContext context, {
    required ValueChanged<DateTime> onDateTimeChanged,
    required String title,
    required bool isChooseTime,
    DateTime? dateTime,
    DateTime? initialDateTime,
  }) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return DateTimeWidget(
          onDateTimeChanged: onDateTimeChanged,
          title: title,
          isChooseTime: isChooseTime,
          dateTime: dateTime,
          initialDateTime: initialDateTime,
        );
      },
    );
  }

  static Future<void> showTimePicker(
    BuildContext context, {
    required ValueChanged<DateTime> onDateTimeChanged,
    String title = '',
    DateTime? currentTime,
    VoidCallback? onConfirm,
  }) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return TimeWidget(
          onDateTimeChanged: onDateTimeChanged,
          title: title,
          currentTime: currentTime,
          onConfirm: onConfirm,
        );
      },
    );
  }
}
