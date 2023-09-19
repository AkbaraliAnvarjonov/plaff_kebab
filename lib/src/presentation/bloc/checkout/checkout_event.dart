part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class ChangeTabEvent extends CheckoutEvent {
  final int tabIndex;

  const ChangeTabEvent({required this.tabIndex});

  @override
  List<Object?> get props => [tabIndex];
}

class CourierCallEvent extends CheckoutEvent {
  final bool isCall;

  const CourierCallEvent({required this.isCall});

  @override
  List<Object?> get props => [isCall];
}

class DeliveryTimeEvent extends CheckoutEvent {
  final DeliveryTime deliveryTime;

  const DeliveryTimeEvent({required this.deliveryTime});

  @override
  List<Object?> get props => [deliveryTime];
}

class PaymentTypeEvent extends CheckoutEvent {
  final PaymentType paymentType;

  const PaymentTypeEvent({required this.paymentType});

  @override
  List<Object?> get props => [paymentType];
}

class ShippingPriceEvent extends CheckoutEvent {
  final LocationData locationData;

  const ShippingPriceEvent({required this.locationData});

  @override
  List<Object?> get props => [locationData];
}

class BranchesEvent extends CheckoutEvent {
  final Point point;
  final int orderPrice;

  const BranchesEvent({required this.point, required this.orderPrice});

  @override
  List<Object?> get props => [point, orderPrice];
}

class OnDemandEvent extends CheckoutEvent {
  final OnDemandModel onDemandModel;

  const OnDemandEvent({required this.onDemandModel});

  @override
  List<Object?> get props => [onDemandModel];
}

class SelectBranchEvent extends CheckoutEvent {
  final Branch selectedBranch;

  const SelectBranchEvent({required this.selectedBranch});

  @override
  List<Object?> get props => [selectedBranch];
}
