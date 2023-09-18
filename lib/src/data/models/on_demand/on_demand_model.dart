import 'package:plaff_kebab/src/data/models/on_demand/step_model.dart';

class OnDemandModel {
  final String apartment;
  final String building;
  final String clientId;
  final int coDeliveryPrice;
  final String deliveryTime;
  final String deliveryType;
  final String description;
  final bool isCourierCall;
  final String extraPhoneNumber;
  final String floor;
  final bool paid;
  final String paymentType;
  final String source;
  final String statusId;
  final List<StepModel> steps;
  final String toAddress;
  final ToLocation toLocation;
  final DateTime? futureTime;

  OnDemandModel({
    required this.apartment,
    required this.building,
    required this.clientId,
    required this.coDeliveryPrice,
    required this.deliveryTime,
    required this.deliveryType,
    required this.description,
    required this.isCourierCall,
    required this.extraPhoneNumber,
    required this.floor,
    required this.paid,
    required this.paymentType,
    required this.source,
    required this.statusId,
    required this.steps,
    required this.toAddress,
    required this.toLocation,
    this.futureTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'apartment': apartment,
      'building': building,
      'client_id': clientId,
      'co_delivery_price': coDeliveryPrice,
      'delivery_time': deliveryTime,
      'delivery_type': deliveryType,
      'description': description,
      'is_courier_call': isCourierCall,
      'extra_phone_number': extraPhoneNumber,
      'floor': floor,
      'paid': paid,
      'payment_type': paymentType,
      'source': source,
      'status_id': statusId,
      'steps': steps.map((step) => step.toJson()).toList(),
      'to_address': toAddress,
      'to_location': toLocation.toJson(),
      'future_time': futureTime?.toIso8601String(),
    };
  }
}

class ToLocation {
  final double lat;
  final double long;

  ToLocation({
    required this.lat,
    required this.long,
  });

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'long': long,
    };
  }

  factory ToLocation.fromJson(Map<String, dynamic> json) {
    return ToLocation(
      lat: json['lat'] ?? 0.0,
      long: json['long'] ?? 0.0,
    );
  }
}
