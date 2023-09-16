import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/bloc/map/map_bloc.dart';
import 'package:plaff_kebab/src/presentation/components/inputs/custom_text_field.dart';
import 'package:plaff_kebab/src/presentation/components/material_border/material_border_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/widget/checkout_bottom_sheet.dart';
import 'package:plaff_kebab/src/presentation/pages/main/home/map/widgets/info_text_field.dart';
import 'package:plaff_kebab/src/presentation/pages/main/home/map/widgets/map_custom_button.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

// ignore: must_be_immutable
class DeliveryLocationWidget extends StatelessWidget {
  const DeliveryLocationWidget({
    super.key,
    required this.adressNameController,
    required this.flatController,
    required this.locationNameController,
    required this.entranceController,
    required this.floorController,
    required this.selectedAdress,
    required this.chooseController,
    required this.yandexMapController,
    required this.onMapCreatedCallback,
  });
  final void Function(YandexMapController)? onMapCreatedCallback;
  final TextEditingController flatController;
  final YandexMapController yandexMapController;
  final TextEditingController locationNameController;
  final TextEditingController entranceController;
  final TextEditingController floorController;
  final TextEditingController adressNameController;
  final int selectedAdress;
  final TextEditingController chooseController;
  @override
  Widget build(BuildContext context) {
    return MaterialBorderWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.tr('delivery_adress'),
              style: context.textStyle.appBarTitle),
          AppUtils.kGap16,
          Text(context.tr('current_adress'),
              style: context.textStyle.regularSubheadline),
          AppUtils.kGap4,
          BlocSelector<MapBloc, MapState, String>(
            selector: (state) => state.title,
            builder: (context, state) {
              locationNameController.text = state;
              return CustomTextField(
                controller: locationNameController,
                haveBorder: false,
                filled: true,
                maxLines: 2,
                minLines: 2,
                readOnly: true,
                fillColor: context.color.black5.withOpacity(0.15),
              );
            },
          ),
          AppUtils.kGap8,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InfoTextField(
                controller: entranceController,
                text: "entrance".tr,
              ),
              InfoTextField(
                controller: floorController,
                text: "floor".tr,
              ),
              InfoTextField(
                controller: flatController,
                text: "flat".tr,
              ),
            ],
          ),
          AppUtils.kGap8,
          CustomTextField(
            controller: adressNameController,
            hintText: "adressName".tr,
            filled: true,
            maxLines: 2,
            fillColor: context.color.black5.withOpacity(0.15),
          ),
          AppUtils.kGap8,
          SizedBox(
            height: 156,
            child: BlocSelector<MapBloc, MapState, List<MapObject>>(
              selector: (state) => state.mapObjects,
              builder: (context, state) {
                return Stack(
                  children: [
                    YandexMap(
                      scrollGesturesEnabled: false,
                      mapObjects: state,
                      rotateGesturesEnabled: false,
                      tiltGesturesEnabled: false,
                      logoAlignment: const MapAlignment(
                        horizontal: HorizontalAlignment.center,
                        vertical: VerticalAlignment.top,
                      ),
                      onMapCreated: onMapCreatedCallback,
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: MapCustomButton(
                        padding: AppUtils.kPaddingAll8,
                        icon: AppIcons.diagonal_resize,
                        onTap: () {},
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: MapCustomButton(
                        padding: AppUtils.kPaddingAll8,
                        icon: AppIcons.get_location_icon,
                        onTap: () {
                          BlocProvider.of<MapBloc>(context)
                              .add(MapLoadedEvent());
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          AppUtils.kGap16,
          Text(
            context.tr("my_adress"),
            style: context.textStyle.regularSubheadline,
          ),
          AppUtils.kGap4,
          CustomTextField(
            suffixIcon: SvgPicture.asset(
              AppIcons.bottom_arrow,
              width: 8,
              height: 14,
            ),
            filled: true,
            fillColor: context.color.black5.withOpacity(0.15),
            controller: chooseController,
            hintText: context.tr("choose_adress"),
            readOnly: true,
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                showDragHandle: false,
                context: context,
                builder: (context) => CheckoutBottomSheet(
                  selectRadioValue: selectedAdress,
                  yandexMapController: yandexMapController,
                  controller: chooseController,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
