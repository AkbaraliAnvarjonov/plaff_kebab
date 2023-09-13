part of 'map_bloc.dart';

class MapState extends Equatable {
  final String error;
  final List<MapObject> mapObjects;
  final bool isMapLoading;
  final Point point;
  final Position? locationData;
  final MapStatus mapStatus;
  final String title;

  const MapState({
    this.error = "",
    this.mapObjects = const [],
    this.isMapLoading = false,
    this.point = const Point(latitude: 41.311081, longitude: 69.240562),
    this.locationData,
    this.mapStatus = MapStatus.initial,
    this.title = "",
  });
  MapState copyWith({
    String? error,
    String? title,
    List<MapObject>? mapObjects,
    bool? isMapLoading,
    Point? point,
    Position? locationData,
    MapStatus? mapStatus,
  }) =>
      MapState(
        title: title ?? this.title,
        error: error ?? this.error,
        mapObjects: mapObjects ?? this.mapObjects,
        isMapLoading: isMapLoading ?? this.isMapLoading,
        point: point ?? this.point,
        locationData: locationData ?? this.locationData,
        mapStatus: mapStatus ?? this.mapStatus,
      );

  @override
  List<Object?> get props => [
        mapObjects,
        isMapLoading,
        point,
        locationData,
        error,
        mapStatus,
      ];
}

enum MapStatus {
  initial,
  loading,
  success,
  error,
}

extension MapStatusX on MapStatus {
  bool get isInitial => this == MapStatus.initial;

  bool get isLoading => this == MapStatus.loading;

  bool get isSuccess => this == MapStatus.success;

  bool get isError => this == MapStatus.error;
}
