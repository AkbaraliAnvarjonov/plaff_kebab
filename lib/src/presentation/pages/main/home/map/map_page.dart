import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/injector_container.dart';
import 'package:plaff_kebab/src/presentation/bloc/map/map_bloc.dart';
import 'package:plaff_kebab/src/presentation/components/loading_widgets/modal_progress_hud.dart';
import 'package:plaff_kebab/src/presentation/pages/main/home/map/widgets/map_widget.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
part 'mixin/map_mixin.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage>
    with TickerProviderStateMixin, HomeMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MapBloc>(
        create: (_) => sl<MapBloc>(),
        child: ModalProgressHUD(
          inAsyncCall: false,
          child: Stack(
            children: [
              Positioned.fill(
                bottom: 300,
                child: BlocSelector<MapBloc, MapState, List<MapObject>>(
                    selector: (state) => state.mapObjects,
                    builder: (context, state) {
                      return YandexMap(
                        mapObjects: state,
                        rotateGesturesEnabled: false,
                        tiltGesturesEnabled: false,
                        logoAlignment: const MapAlignment(
                          horizontal: HorizontalAlignment.center,
                          vertical: VerticalAlignment.top,
                        ),
                        onMapCreated: (yandexMapController) async {
                          BlocProvider.of<MapBloc>(context).add(MapLoadedEvent(
                              yandexMapController: yandexMapController));
                          await yandexMapController.toggleUserLayer(
                              visible: false);
                        },
                        onMapTap: (point) async {
                          BlocProvider.of<MapBloc>(context).add(MapLocationChanged(value: point));
                        },
                        onCameraPositionChanged: (cameraPosition, _, finished) {
                          if (finished) {
                            BlocProvider.of<MapBloc>(context).add(MapLocationChanged(
                                value: cameraPosition.target));
                          }
                        },
                      );
                    }),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: MapWidget(
                  adressNameController: adressNameController,
                  entranceController: entranceController,
                  locationNameController: locationNameController,
                  floorController: floorController,
                  flatController: flatController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
