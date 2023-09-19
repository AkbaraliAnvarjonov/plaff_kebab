import 'package:plaff_kebab/src/data/models/on_demand/on_demand_model.dart';
import 'package:plaff_kebab/src/data/models/product/history_order/courier_model.dart';
import 'package:plaff_kebab/src/data/models/product/history_order/discount_model.dart';
import 'package:plaff_kebab/src/data/models/product/history_order/shipper_user.dart';
import 'package:plaff_kebab/src/data/models/product/history_order/status_notes.dart';
import 'package:plaff_kebab/src/data/models/product/steps_model.dart';

class Orders {
  ToLocation? toLocation;
  String? toAddress;
  String? clientName;
  String? clientPhoneNumber;
  int? coDeliveryPrice;
  int? deliveryPrice;
  String? description;
  String? externalOrderId;
  String? deliveryTime;
  String? deliveryType;
  String? id;
  String? clientId;
  String? courierId;
  Courier? courier;
  String? statusId;
  String? createdAt;
  String? finishedAt;
  String? paymentType;
  String? source;
  String? apartment;
  String? building;
  String? floor;
  String? extraPhoneNumber;
  num? orderAmount;
  bool? paid;
  String? rating;
  String? review;
  ShipperUser? shipperUser;
  List<Steps> steps = [];
  List<StatusNotes> statusNotes = [];
  List<DiscountsModel> discountsModel = [];
  dynamic jowiId;
  dynamic iikoId;
  dynamic distance;

  num? totalDiscountPrice;

  Orders({
    this.toLocation,
    this.toAddress,
    this.clientName,
    this.clientPhoneNumber,
    this.coDeliveryPrice,
    this.deliveryPrice,
    this.description,
    this.externalOrderId,
    this.deliveryTime,
    this.deliveryType,
    this.id,
    this.clientId,
    this.courierId,
    this.courier,
    this.statusId,
    this.createdAt,
    this.finishedAt,
    this.paymentType,
    this.source,
    this.apartment,
    this.building,
    this.floor,
    this.extraPhoneNumber,
    this.orderAmount,
    this.paid,
    this.rating,
    this.review,
    this.shipperUser,
    this.steps = const [],
    this.statusNotes = const [],
    this.jowiId,
    this.iikoId,
    this.distance,
    this.totalDiscountPrice,
    this.discountsModel = const [],
  });

  Orders.fromJson(Map<String, dynamic> json) {
    toLocation = json['to_location'] != null
        ? ToLocation.fromJson(json['to_location'])
        : null;
    toAddress = json['to_address'];
    clientName = json['client_name'];
    clientPhoneNumber = json['client_phone_number'];
    coDeliveryPrice = json['co_delivery_price'];
    deliveryPrice = json['delivery_price'];
    description = json['description'];
    externalOrderId = json['external_order_id'];
    deliveryTime = json['delivery_time'];
    deliveryType = json['delivery_type'];
    id = json['id'];
    clientId = json['client_id'];
    courierId = json['courier_id'];
    courier =
        json['courier'] != null ? Courier.fromJson(json['courier']) : null;
    statusId = json['status_id'];
    createdAt = json['created_at'];
    finishedAt = json['finished_at'];
    paymentType = json['payment_type'];
    source = json['source'];
    apartment = json['apartment'];
    building = json['building'];
    floor = json['floor'];
    extraPhoneNumber = json['extra_phone_number'];
    orderAmount = json['order_amount'];
    paid = json['paid'];
    rating = json['rating'];
    review = json['review'];
    steps = <Steps>[];
    if (json['steps'] != null) {
      json['steps'].forEach((v) {
        steps.add(Steps.fromJson(v));
      });
    }
    statusNotes = <StatusNotes>[];
    if (json['status_notes'] != null) {
      json['status_notes'].forEach((v) {
        statusNotes.add(StatusNotes.fromJson(v));
      });
    }
    discountsModel = <DiscountsModel>[];
    if (json['discounts'] != null) {
      json['discounts'].forEach(
        (v) {
          discountsModel.add(DiscountsModel.fromJson(v));
        },
      );
    }
    shipperUser = json['shipper_user'] != null
        ? ShipperUser.fromJson(json['shipper_user'])
        : null;
    jowiId = json['jowi_id'];
    iikoId = json['iiko_id'];
    distance = json['distance'];
    totalDiscountPrice = json['discount_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (toLocation != null) {
      data['to_location'] = toLocation?.toJson();
    }
    data['to_address'] = toAddress;
    data['client_name'] = clientName;
    data['client_phone_number'] = clientPhoneNumber;
    data['co_delivery_price'] = coDeliveryPrice;
    data['delivery_price'] = deliveryPrice;
    data['description'] = description;
    data['external_order_id'] = externalOrderId;
    data['delivery_time'] = deliveryTime;
    data['delivery_type'] = deliveryType;
    data['id'] = id;
    data['client_id'] = clientId;
    data['courier_id'] = courierId;
    if (courier != null) {
      data['courier'] = courier?.toJson();
    }
    data['status_id'] = statusId;
    data['created_at'] = createdAt;
    data['finished_at'] = finishedAt;
    data['payment_type'] = paymentType;
    data['source'] = source;
    data['apartment'] = apartment;
    data['building'] = building;
    data['floor'] = floor;
    data['extra_phone_number'] = extraPhoneNumber;
    data['order_amount'] = orderAmount;
    data['paid'] = paid;
    data['rating'] = rating;
    data['review'] = review;
    data['steps'] = steps.map((v) => v.toJson()).toList();
    data['status_notes'] = statusNotes.map((v) => v).toList();
    return data;
  }
}
