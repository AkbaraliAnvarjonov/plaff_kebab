import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/bloc/checkout/checkout_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/map/map_bloc.dart';
import 'package:plaff_kebab/src/presentation/components/material_border/material_border_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/widget/branch_item_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/home/map/widgets/map_custom_button.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class SelfPickUpWidget extends StatelessWidget {
  SelfPickUpWidget({super.key});
  late final YandexMapController yandexMapController;

  @override
  Widget build(BuildContext context) {
    return MaterialBorderWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'the_nearest_branches'.tr,
            style: context.textStyle.regularSubheadline,
          ),
          AppUtils.kGap12,
          SizedBox(
            height: 156,
            child: ClipRRect(
              borderRadius: AppUtils.kBorderRadius12,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: BlocSelector<MapBloc, MapState, List<MapObject>>(
                        selector: (state) => state.mapObjects,
                        builder: (context, state) {
                          return YandexMap(
                            scrollGesturesEnabled: false,
                            mapObjects: state,
                            rotateGesturesEnabled: false,
                            tiltGesturesEnabled: false,
                            logoAlignment: const MapAlignment(
                              horizontal: HorizontalAlignment.center,
                              vertical: VerticalAlignment.top,
                            ),
                            onMapCreated: (controller) async {
                              yandexMapController = controller;
                              BlocProvider.of<MapBloc>(context).add(
                                MapLoadedEvent(
                                    yandexMapController: yandexMapController),
                              );

                              await yandexMapController.toggleUserLayer(
                                  visible: false);
                            },
                            zoomGesturesEnabled: false,
                          );
                        }),
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
                        BlocProvider.of<MapBloc>(context).add(MapLoadedEvent());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          AppUtils.kGap16,
          BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state.branches.isEmpty) return AppUtils.kBox;

              return ListView.separated(
                shrinkWrap: true,
                itemCount: state.branches.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return BranchItemWidget(
                    selectedBranch: state.selectedBranch,
                    branch: state.branches[index],
                    onTap: () {
                      BlocProvider.of<MapBloc>(context).add(MapLocationChanged(
                        value: Point(
                            latitude: state.branches[index].location.lat,
                            longitude: state.branches[index].location.long),
                      ));
                      yandexMapController.moveCamera(
                        CameraUpdate.newCameraPosition(
                          CameraPosition(
                            target: Point(
                                latitude: state.branches[index].location.lat,
                                longitude: state.branches[index].location.long),
                            zoom: 20,
                          ),
                        ),
                        animation: const MapAnimation(),
                      );
                      BlocProvider.of<CheckoutBloc>(context).add(
                        SelectBranchEvent(
                          selectedBranch: state.branches[index],
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (_, __) => Padding(
                  padding: const EdgeInsets.only(
                    left: 50,
                  ),
                  child: AppUtils.kDivider,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
