part of 'user_adresses_bloc.dart';

class UserAdressesState extends Equatable {
  const UserAdressesState({
    this.error = "",
    this.locationStatus = LocationStatus.initial,
    this.customerAddresses = const [],
  });
  final String error;
  final LocationStatus locationStatus;
  final List<CustomerAddress> customerAddresses;

  UserAdressesState copyWith({
    String? error,
    LocationStatus? locationStatus,
    List<CustomerAddress>? customerAddresses,
  }) =>
      UserAdressesState(
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
