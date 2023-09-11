import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/presentation/components/loading_widgets/modal_progress_hud.dart';
import 'package:plaff_kebab/src/presentation/pages/main/home/map/widgets/map_widget.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: false,
        child: Stack(
          children: [
            Positioned.fill(
              bottom: 300,
              child: YandexMap(
                // mapObjects: ctr.mapObjects,
                rotateGesturesEnabled: false,
                tiltGesturesEnabled: false,
                logoAlignment: const MapAlignment(
                  horizontal: HorizontalAlignment.center,
                  vertical: VerticalAlignment.top,
                ),
                onMapCreated: (yandexMapController) async {
                  // ctr.setMapController(yandexMapController);
                  // await ctr.getCurrentLocation();
                  // await yandexMapController.toggleUserLayer(visible: false);
                },
                onMapTap: (point) async {
                  // await ctr.setMapObject(point);
                  // await ctr.getTheNearestBranches();
                },
                onCameraPositionChanged: (cameraPosition, _, finished) {
                  if (finished) {
                    // ctr.setMapObject(cameraPosition.target);
                  }
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MapWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
