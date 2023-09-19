part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class GetOrders extends OrderEvent {
  const GetOrders();

  @override
  List<Object?> get props => [];
}
