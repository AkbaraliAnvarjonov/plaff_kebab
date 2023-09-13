import 'package:equatable/equatable.dart';
import 'package:plaff_kebab/src/config/themes/themes.dart';
import 'package:plaff_kebab/src/core/mixin/yandex_location.dart';
import 'package:plaff_kebab/src/data/models/adress/adress_model.dart';
import 'package:plaff_kebab/src/domain/repositories/adress/adress_repository.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'map_event.dart';

part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> with YandexLocation {
  MapBloc(this.adressRepository) : super(const MapState()) {
    on<MapLoadedEvent>(_mapLoad);
    on<MapLocationChanged>(_mapLocationChanged);
    on<PostLocationInfo>(_postLocationInfo);
  }

  final MapObjectId targetMapObjectId = const MapObjectId('target_place_mark');
  AdressRepository adressRepository;
  late YandexMapController _yandexMapController;

  _mapLoad(MapLoadedEvent event, Emitter<MapState> emit) async {
    final result = await adressRepository.getCurrentLocation();
    if (event.yandexMapController != null) {
      _yandexMapController = event.yandexMapController!;
    }

    try {
      final locationResult = result.fold(
        (l) {
          throw Exception(l.toString());
        },
        (r) => r,
      );

      String title = await getLocationName(
        geoCodeText: "${locationResult.longitude},${locationResult.latitude}",
      );

      await _yandexMapController.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: Point(
              latitude: locationResult.latitude,
              longitude: locationResult.longitude,
            ),
            zoom: 20,
          ),
        ),
        animation: const MapAnimation(),
      );

      PlacemarkMapObject placeMark = PlacemarkMapObject(
        mapId: targetMapObjectId,
        point: Point(
          latitude: locationResult.latitude,
          longitude: locationResult.longitude,
        ),
        zIndex: 20,
        opacity: 1,
        icon: PlacemarkIcon.single(
          PlacemarkIconStyle(
            image: BitmapDescriptor.fromAssetImage(AppImages.mapPointer),
          ),
        ),
      );

      emit(
        state.copyWith(
          title: title,
          locationData: locationResult,
          mapObjects: [placeMark],
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          error: e.toString(),
        ),
      );
    }
  }

  _mapLocationChanged(MapLocationChanged event, Emitter<MapState> emit) async {
    PlacemarkMapObject placeMark = PlacemarkMapObject(
      mapId: targetMapObjectId,
      point: event.value,
      zIndex: 20,
      opacity: 1,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage(
            AppImages.mapPointer,
          ),
        ),
      ),
    );

    emit(
      state.copyWith(
        title: await getLocationName(
            geoCodeText: "${event.value.longitude},${event.value.latitude}"),
        mapObjects: [placeMark],
      ),
    );
  }

  _postLocationInfo(PostLocationInfo event, Emitter<MapState> emit) async {
    final result = await adressRepository.postAdress(event.adress);

    result.fold((left) {
      emit(state.copyWith(mapStatus: MapStatus.error));
    }, (right) {
      emit(state.copyWith(mapStatus: MapStatus.success));
    });
  }

  @override
  Future<void> close() {
    _yandexMapController.dispose();
    return super.close();
  }
}
