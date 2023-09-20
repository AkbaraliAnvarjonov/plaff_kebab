import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/bloc/checkout/checkout_bloc.dart';
import 'package:plaff_kebab/src/presentation/components/date_time/time_picker.dart';
import 'package:plaff_kebab/src/presentation/components/inputs/custom_text_field.dart';

class DeliveryTimeWidget extends StatelessWidget {
  DeliveryTimeWidget({Key? key}) : super(key: key);
  final TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocSelector<CheckoutBloc, CheckoutState, DateTime?>(
        selector: (state) => state.dateTime,
        builder: (context, state) {
          DateTime initialDateTime =
              DateTime.now().add(const Duration(minutes: 30));
          return Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: AppUtils.kBorderRadius12,
            ),
            padding: AppUtils.kPaddingAll16,
            margin: AppUtils.kPaddingBottom8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'choose_time'.tr,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: (MediaQuery.of(context).size.width - 48) / 2,
                      child: CustomTextField(
                        readOnly: true,
                        onTap: () {
                          TimePicker.showDatePicker(
                            context,
                            title: 'choose_time'.tr,
                            onDateTimeChanged: (date) {
                              dateController.text =
                                  "${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}";
                              state = DateTime(date.year, date.month, date.day);
                            },
                            isChooseTime: true,
                            initialDateTime: DateTime(initialDateTime.year,
                                initialDateTime.month, initialDateTime.day),
                            dateTime: state,
                          );
                        },
                        suffixIcon: const Icon(Icons.date_range),
                        controller: dateController,
                        hintText:
                            "${DateTime.now().day.toString().padLeft(2, '0')}.${DateTime.now().month.toString().padLeft(2, '0')}.${DateTime.now().year}",
                      ),
                    ),
                    AppUtils.kGap16,
                    Expanded(
                      child: SizedBox(
                        width: (MediaQuery.of(context).size.width - 48) / 2,
                        child: InkWell(
                          onTap: () {
                            //  controller.selectFutureTime(
                            //   context, controller.shipperFutureTime ?? '0'),
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 22),
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: context.colorScheme.surface,
                              borderRadius: AppUtils.kBorderRadius8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: context.color.black3,
                                      size: 20,
                                    ),
                                    AppUtils.kGap8,
                                    Text(
                                      '${state?.hour ?? DateTime.now().hour.toString().padLeft(2, '0')}'
                                      ':${state?.minute ?? DateTime.now().toString().padLeft(2, '0')}',
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: context.color.black3,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
