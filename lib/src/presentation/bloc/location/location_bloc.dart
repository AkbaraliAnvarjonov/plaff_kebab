import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/data/models/adress/adress_model.dart';
import 'package:plaff_kebab/src/domain/repositories/adress/adress_repository.dart';

part 'location_event.dart';

part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc(this.adressRepository) : super(const LocationState()) {
    on<GetCustomerAdresses>(_getCustomerAdresses);
  }

  final AdressRepository adressRepository;

  _getCustomerAdresses(
      GetCustomerAdresses event, Emitter<LocationState> emit) async {
    emit(state.copyWith(locationStatus: LocationStatus.loading));

    final result = await adressRepository.getAdresses();

    result.fold(
      (l) {
        emit(state.copyWith(
            error: l.toString(), locationStatus: LocationStatus.error));
      },
      (r) {
        emit(
          state.copyWith(
              customerAddresses: r, locationStatus: LocationStatus.success),
        );
      },
    );
  }
}
