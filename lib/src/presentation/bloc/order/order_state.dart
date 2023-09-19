part of 'order_bloc.dart';

class OrderState extends Equatable {
  const OrderState({
    this.orders = const [],
    this.error = '',
  });

  final List<Orders> orders;
  final String error;
  OrderState copyWith({
    List<Orders>? orders,
    String? error,
  }) =>
      OrderState(
        orders: orders ?? this.orders,
        error: error ?? this.error,
      );

  @override
  List<Object?> get props => [
        orders,
        error,
      ];
}
