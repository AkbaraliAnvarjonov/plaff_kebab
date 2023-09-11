import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/pages/main/home/map/widgets/map_custom_button.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        MapCustomButton(
          margin: const EdgeInsets.only(bottom: 16, right: 16),
          icon: AppIcons.map_pointer,
          onTap: () {
            // ctr.findMyLocation();
          },
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            color: context.color.cardColor,
          ),
          child: SafeArea(
            top: false,
            minimum: AppUtils.kPaddingAll12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text('select_the_receipt_method'.tr,
                          style: context.textStyle.appBarTitle),
                    ),
                    IconButton(
                      icon: const Icon(Icons.clear, size: 28),
                      onPressed: () {},
                    )
                  ],
                ),
                Text('to_see_actual_menu'.tr),
                AppUtils.kGap12,
                // CustomTabBar(
                //   padding: AppUtils.kAllPadding0,
                //   controller: ctr.tabController,
                //   labels: ['delivery'.tr, 'self_pick_up'.tr],
                //   onTap: (index) {
                //     ctr.setDeliveryType(DeliveryType.values[index]);
                //   },
                // ),
                AppUtils.kGap12,
                // if (ctr.deliveryType == DeliveryType.delivery) ...[
                //   CustomMapTextField(
                //     suffixIcon: InkWell(
                //       onTap: () {
                //         // ctr.clearPointedLocation();
                //       },
                //       child: const Icon(
                //         Icons.close,
                //       ),
                //     ),
                //     labelText: 'delivery_address'.tr,
                //     hintTextStyle: TextStyle(
                //       fontSize: 15,
                //       fontWeight: FontWeight.w400,
                //       color: context.color.black5,
                //     ),
                //     hintText: 'please_select_delivery_address'.tr,
                //     // currentFocus: AlwaysDisabledFocusNode(),
                //     controller: ctr.locationController,
                //     errorText: 'choose_address'.tr,
                //     showError: ctr.showLocationError ?? false,
                //     keyboardType: TextInputType.text,
                //     onTap: () async {},
                //   ),
                //   AppUtils.kBoxHeight16,
                // ],
                // if (ctr.deliveryType == DeliveryType.selfPickup)
                //   ConstrainedBox(
                //     constraints: BoxConstraints(
                //       maxHeight: Get.height * 0.35,
                //     ),
                //     child: DeliveryTypeMapListViewWidget(
                //       selectedBranch: ctr.selectedBranch,
                //       branches: ctr.branches,
                //       onTap: (index) async {
                //         await ctr.setSelectedBranch(index);
                //       },
                //     ),
                //   ),
                AppUtils.kGap12,
                // SafeArea(
                //   top: false,
                //   child: CustomButton(
                //     text: 'confirm'.tr,
                //     onTap: () async {
                //       await ctr.onConfirmButtonPressed();
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
