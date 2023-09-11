part of 'location_bloc.dart';

class LocationState extends Equatable {
  const LocationState({
    this.error = "",
    this.locationStatus = LocationStatus.initial,
    this.customerAddresses = const [],
  });
  final String error;
  final LocationStatus locationStatus;
  final List<CustomerAddress> customerAddresses;

  LocationState copyWith({
    String? error,
    LocationStatus? locationStatus,
    List<CustomerAddress>? customerAddresses,
  }) =>
      LocationState(
        error: error ?? this.error,
        locationStatus: locationStatus ?? this.locationStatus,
        customerAddresses: customerAddresses ?? this.customerAddresses,
      );

  @override
  List<Object?> get props => [
        error,
        locationStatus,
        customerAddresses,
      ];
}

enum LocationStatus {
  initial,
  loading,
  success,
  error,
}

extension ProductStatusX on LocationStatus {
  bool get isInitial => this == LocationStatus.initial;

  bool get isLoading => this == LocationStatus.loading;

  bool get isSuccess => this == LocationStatus.success;

  bool get isError => this == LocationStatus.error;
}
