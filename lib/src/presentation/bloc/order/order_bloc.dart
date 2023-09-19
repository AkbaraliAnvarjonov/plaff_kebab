import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/data/models/product/history_order/history_order.dart';
import 'package:plaff_kebab/src/domain/repositories/order/order_repository.dart';

part 'order_state.dart';
part 'order_event.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc(this.orderRepository) : super(const OrderState()) {
    on<GetOrders>(_getOrders);
  }

  final OrderRepository orderRepository;
  _getOrders(GetOrders event, Emitter<OrderState> emit) async {
    final result = await orderRepository.getProductwithId();

    result.fold(
      (l) {
        emit(state.copyWith(error: l.toString()));
      },
      (r) {
        emit(state.copyWith(orders: r));
      },
    );
  }
}
