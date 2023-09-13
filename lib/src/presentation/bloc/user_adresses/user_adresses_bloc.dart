import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/data/models/adress/adress_model.dart';
import 'package:plaff_kebab/src/domain/repositories/adress/adress_repository.dart';

part 'user_adresses_event.dart';

part 'user_adresses_state.dart';

class UserAdressesBloc extends Bloc<UserAdressesEvent, UserAdressesState> {
  UserAdressesBloc(this.adressRepository) : super(const UserAdressesState()) {
    on<GetCustomerAdresses>(_getCustomerAdresses);
  }

  final AdressRepository adressRepository;

  _getCustomerAdresses(
      GetCustomerAdresses event, Emitter<UserAdressesState> emit) async {
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
