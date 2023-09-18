part of 'checkout_bloc.dart';

class CheckoutState extends Equatable {
  const CheckoutState({
    this.deliveryTime = DeliveryTime.fastDelivery,
    this.deliveryType = DeliveryType.delivery,
    this.paymentType = PaymentType.cash,
    this.isCall = true,
    this.shippingPrice = 0,
    this.error = '',
    this.branches = const [],
  });

  final String error;
  final PaymentType paymentType;
  final DeliveryType deliveryType;
  final DeliveryTime deliveryTime;
  final bool isCall;
  final int shippingPrice;
  final List<Branch> branches;

  CheckoutState copyWith({
    final String? error,
    final PaymentType? paymentType,
    final DeliveryType? deliveryType,
    final DeliveryTime? deliveryTime,
    final bool? isCall,
    final int? shippingPrice,
    final List<Branch>? branches,
  }) =>
      CheckoutState(
        paymentType: paymentType ?? this.paymentType,
        error: error ?? this.error,
        deliveryTime: deliveryTime ?? this.deliveryTime,
        deliveryType: deliveryType ?? this.deliveryType,
        isCall: isCall ?? this.isCall,
        shippingPrice: shippingPrice ?? this.shippingPrice,
        branches: branches ?? this.branches,
      );

  @override
  List<Object?> get props => [
        paymentType,
        deliveryTime,
        deliveryType,
        isCall,
        shippingPrice,
        branches,
      ];
}
