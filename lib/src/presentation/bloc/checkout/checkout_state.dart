part of 'checkout_bloc.dart';

class CheckoutState extends Equatable {
  const CheckoutState({
    this.deliveryTime = DeliveryTime.fastDelivery,
    this.deliveryType = DeliveryType.delivery,
    this.paymentType = PaymentType.cash,
    this.isCall = true,
    this.status = OnDemandStatus.initial,
    this.shippingPrice = 0,
    this.error = '',
    this.branches = const [],
    this.point = const Point(latitude: 41, longitude: 63),
    this.selectedBranch,
  });

  final String error;
  final PaymentType paymentType;
  final DeliveryType deliveryType;
  final DeliveryTime deliveryTime;
  final bool isCall;
  final int shippingPrice;
  final OnDemandStatus status;
  final List<Branch> branches;
  final Point point;
  final Branch? selectedBranch;

  CheckoutState copyWith({
    final String? error,
    final PaymentType? paymentType,
    final DeliveryType? deliveryType,
    final DeliveryTime? deliveryTime,
    final bool? isCall,
    final int? shippingPrice,
    final OnDemandStatus? status,
    final List<Branch>? branches,
    final Branch? selectedBranch,
    final Point? point,
  }) =>
      CheckoutState(
        selectedBranch: selectedBranch ?? this.selectedBranch,
        paymentType: paymentType ?? this.paymentType,
        error: error ?? this.error,
        deliveryTime: deliveryTime ?? this.deliveryTime,
        deliveryType: deliveryType ?? this.deliveryType,
        isCall: isCall ?? this.isCall,
        shippingPrice: shippingPrice ?? this.shippingPrice,
        branches: branches ?? this.branches,
        status: status ?? this.status,
        point: point ?? this.point,
      );

  @override
  List<Object?> get props => [
        paymentType,
        deliveryTime,
        deliveryType,
        isCall,
        shippingPrice,
        branches,
        status,
        point,
        selectedBranch,
      ];
}

enum OnDemandStatus {
  initial,
  loading,
  success,
  error,
}

extension OndemandStatusX on OnDemandStatus {
  bool get isInitial => this == OnDemandStatus.initial;

  bool get isLoading => this == OnDemandStatus.loading;

  bool get isSuccess => this == OnDemandStatus.success;

  bool get isError => this == OnDemandStatus.error;
}
