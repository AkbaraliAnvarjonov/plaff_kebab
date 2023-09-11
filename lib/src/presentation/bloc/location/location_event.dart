part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();
}

class GetCustomerAdresses extends LocationEvent {
  const GetCustomerAdresses();
  @override
  List<Object?> get props => [];
}
