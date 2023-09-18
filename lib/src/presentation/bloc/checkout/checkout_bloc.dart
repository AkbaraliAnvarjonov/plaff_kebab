import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/data/models/adress/branch_model.dart';
import 'package:plaff_kebab/src/data/models/adress/location_data.dart';
import 'package:plaff_kebab/src/data/models/on_demand/on_demand_model.dart';
import 'package:plaff_kebab/src/data/models/product/onedemand_order.dart';
import 'package:plaff_kebab/src/domain/repositories/adress/adress_repository.dart';
import 'package:plaff_kebab/src/domain/repositories/one_demand/on_demand_repository.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'checkout_event.dart';

part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc(this.adressRepository, this.onDemandRepository)
      : super(const CheckoutState()) {
    on<ChangeTabEvent>(_changeTab);
    on<CourierCallEvent>(_isCall);
    on<DeliveryTimeEvent>(_changeDeliveryType);
    on<PaymentTypeEvent>(_changePaymentType);
    on<ShippingPriceEvent>(_calculateShipping);
    on<BranchesEvent>(_getNearestBranches);
    on<OnDemandEvent>(_onDemandOrder);
  }

  final AdressRepository adressRepository;
  final OnDemandRepository onDemandRepository;

  _changeTab(ChangeTabEvent event, Emitter<CheckoutState> emit) {
    emit(state.copyWith(
      deliveryType:
          event.tabIndex == 0 ? DeliveryType.delivery : DeliveryType.selfPickup,
    ));
  }

  _isCall(CourierCallEvent event, Emitter<CheckoutState> emit) {
    emit(state.copyWith(isCall: event.isCall));
  }

  _changeDeliveryType(DeliveryTimeEvent event, Emitter<CheckoutState> emit) {
    emit(state.copyWith(deliveryTime: event.deliveryTime));
  }

  _changePaymentType(PaymentTypeEvent event, Emitter<CheckoutState> emit) {
    emit(state.copyWith(paymentType: event.paymentType));
  }

  _calculateShipping(
      ShippingPriceEvent event, Emitter<CheckoutState> emit) async {
    final result = await adressRepository.calculateShipping(event.locationData);
    result.fold(
      (l) {
        emit(state.copyWith(error: l.toString()));
      },
      (r) {
        emit(
          state.copyWith(
            shippingPrice: r.price,
            point: Point(
              latitude: event.locationData.latitude,
              longitude: event.locationData.longitude,
            ),
          ),
        );
      },
    );
  }

  _onDemandOrder(OnDemandEvent event, Emitter<CheckoutState> emit) async {
    emit(state.copyWith(status: OnDemandStatus.loading));
    final result = await onDemandRepository.onDemandOrder(event.onDemandModel);
    result.fold(
      (l) {
        emit(state.copyWith(error: l.toString(), status: OnDemandStatus.error));
      },
      (r) {
        emit(state.copyWith(status: OnDemandStatus.success));
      },
    );
  }

  _getNearestBranches(BranchesEvent event, Emitter<CheckoutState> emit) async {
    final result = await adressRepository.getNearestBranches(event.point);
    result.fold(
      (l) {
        emit(state.copyWith(error: l.toString()));
      },
      (r) {
        emit(state.copyWith(branches: r));
        add(ShippingPriceEvent(
            locationData: LocationData(
          branchId: r[0].id,
          latitude: event.point.latitude,
          longitude: event.point.longitude,
          orderPrice: event.orderPrice,
        )));
      },
    );
  }
}
