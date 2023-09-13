part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {}

class MapLoadedEvent extends MapEvent {
  MapLoadedEvent({
    this.yandexMapController,
  });
  final YandexMapController? yandexMapController;
  @override
  List<Object?> get props => [yandexMapController];
}

class MapLocationChanged extends MapEvent {
  final Point value;
  MapLocationChanged({required this.value});
  @override
  List<Object?> get props => [value];
}

class PostLocationInfo extends MapEvent {
  final CustomerAddress adress;
  PostLocationInfo({required this.adress});
  @override
  List<Object?> get props => [adress];
}
