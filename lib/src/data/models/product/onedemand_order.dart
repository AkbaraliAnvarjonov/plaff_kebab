import 'package:plaff_kebab/src/data/models/adress/location_model.dart';
import 'package:plaff_kebab/src/data/models/product/steps_model.dart';


enum PaymentType {
  cash,
  click,
  payMe,
}

enum DeliveryType {
  delivery,
  selfPickup,
}
//qo'shish kere
//bool? isCourierCall;

//qayta qilnvotkan zakazmi check qlsh kere
//bool? isCancelOldOrder;

enum DeliveryTime {
  fastDelivery,
  scheduledDelivery,
}

class OnDemandOrderRequest {
  String? aggregatorId;
  String? apartment;
  String? building;
  String? clientId;
  int? coDeliveryPrice;
  String? deliveryTime;
  String? deliveryType;
  String? description;
  String? extraPhoneNumber;
  String? floor;
  bool? paid;
  String? paymentType;
  String? source;
  String? statusId;
  List<Steps> steps = [];
  String? toAddress;
  bool? isCourierCall;
  LocationModel? toLocation;
  String? futureTime;

  OnDemandOrderRequest({
    this.aggregatorId,
    this.apartment,
    this.building,
    this.clientId,
    this.coDeliveryPrice,
    this.deliveryTime,
    this.deliveryType,
    this.description,
    this.extraPhoneNumber,
    this.floor,
    this.paid,
    this.isCourierCall,
    this.paymentType,
    this.source,
    this.statusId,
    this.steps = const [],
    this.toAddress,
    this.toLocation,
    this.futureTime,
  });

  OnDemandOrderRequest.fromJson(Map<String, dynamic> json) {
    // apartment = json['aggregator_id'];
    apartment = json['apartment'];
    building = json['building'];
    clientId = json['client_id'];
    coDeliveryPrice = json['co_delivery_price'];
    deliveryTime = json['delivery_time'];
    deliveryType = json['delivery_type'];
    description = json['description'];
    isCourierCall = json['is_courier_call'];
    extraPhoneNumber = json['extra_phone_number'];
    floor = json['floor'];
    paid = json['paid'];
    paymentType = json['payment_type'];
    source = json['source'];
    statusId = json['status_id'];
    steps = <Steps>[];
    if (json['steps'] != null) {
      json['steps'].forEach((v) {
        steps.add(Steps.fromJson(v));
      });
    }
    toAddress = json['to_address'];
    toLocation = json['to_location'] != null
        ? LocationModel.fromJson(json['to_location'])
        : null;
    futureTime = json['future_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['aggregator_id'] = this.aggregatorId;
    data['apartment'] = apartment;
    data['building'] = building;
    data['client_id'] = clientId;
    data['co_delivery_price'] = coDeliveryPrice;
    data['delivery_time'] = deliveryTime;
    data['delivery_type'] = deliveryType;
    data['description'] = description;
    data['is_courier_call'] = isCourierCall;
    data['extra_phone_number'] = extraPhoneNumber;
    data['floor'] = floor;
    data['paid'] = paid;
    data['payment_type'] = paymentType;
    data['source'] = source;
    data['status_id'] = statusId;
    data['steps'] = steps.map((v) => v.toJson()).toList();
    data['to_address'] = toAddress;
    if (toLocation != null) {
      data['to_location'] = toLocation?.toJson();
    }
    data['future_time'] = futureTime;

    return data;
  }
}
