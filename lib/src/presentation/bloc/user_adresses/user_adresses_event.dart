part of 'user_adresses_bloc.dart';

abstract class UserAdressesEvent extends Equatable {
  const UserAdressesEvent();
}

class GetCustomerAdresses extends UserAdressesEvent {
  const GetCustomerAdresses();
  @override
  List<Object?> get props => [];
}
