import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/config/router/app_routes.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/data/models/adress/adress_model.dart';
import 'package:plaff_kebab/src/data/models/adress/location_model.dart';
import 'package:plaff_kebab/src/presentation/bloc/map/map_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/user_adresses/user_adresses_bloc.dart';
import 'package:plaff_kebab/src/presentation/components/buttons/bottom_button.dart';
import 'package:plaff_kebab/src/presentation/components/inputs/custom_text_field.dart';
import 'package:plaff_kebab/src/presentation/pages/main/home/map/widgets/info_text_field.dart';
import 'package:plaff_kebab/src/presentation/pages/main/home/map/widgets/map_custom_button.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({
    super.key,
    required this.adressNameController,
    required this.entranceController,
    required this.locationNameController,
    required this.floorController,
    required this.flatController,
  });
  final TextEditingController locationNameController;
  final TextEditingController entranceController;
  final TextEditingController floorController;
  final TextEditingController flatController;
  final TextEditingController adressNameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        MapCustomButton(
          margin: const EdgeInsets.only(bottom: 16, right: 16),
          icon: AppIcons.get_location_icon,
          onTap: () {
            BlocProvider.of<MapBloc>(context).add(MapLoadedEvent());
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
                Text(context.tr('delivery_adress'),
                    style: context.textStyle.appBarTitle),
                AppUtils.kGap12,
                BlocSelector<MapBloc, MapState, String>(
                  selector: (state) {
                    locationNameController.text = state.title;
                    return state.title;
                  },
                  builder: (context, state) => CustomTextField(
                    controller: locationNameController,
                    haveBorder: false,
                    filled: true,
                    maxLines: 2,
                    minLines: 2,
                    readOnly: true,
                    fillColor: context.color.black5.withOpacity(0.15),
                  ),
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
                  width: double.infinity,
                  child: BlocConsumer<MapBloc, MapState>(
                      listener: (context, state) {
                    if (state.mapStatus == MapStatus.success) {
                      BlocProvider.of<UserAdressesBloc>(context)
                          .add(const GetCustomerAdresses());
                      Navigator.popUntil(
                        context,
                        (route) => route.isFirst,
                      );
                    }
                  }, builder: (context, state) {
                    return BottomButton(
                      text: context.tr("confirm"),
                      onTap: () {
                        BlocProvider.of<MapBloc>(context).add(PostLocationInfo(
                            adress: CustomerAddress(
                          address: locationNameController.text,
                          apartment: flatController.text,
                          building: entranceController.text,
                          customerId: localSource.userId,
                          description: "",
                          floor: floorController.text,
                          id: "",
                          location: LocationModel(
                              lat: state.point.latitude,
                              long: state.point.longitude),
                          name: adressNameController.text,
                        )));
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
