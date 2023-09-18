import 'package:plaff_kebab/src/data/models/adress/location_model.dart';

class Branch {
  final String id;
  final String shipperId;
  final String name;
  final String? image;
  final String phone;
  final bool isActive;
  final String address;
  final LocationModel location;
  final String createdAt;
  final String updatedAt;
  final String destination;
  final String workHourStart;
  final String workHourEnd;
  final String? jowiId;
  final String? iikoId;
  final String? iikoTerminalId;
  final String fareId;
  final String tgChatId;
  final String? geozoneId;
  final String? geozone;
  final String ordersLimit;
  final int radiusWithoutDeliveryPrice;
  final int realTimeOrdersAmount;
  final String? fare;
  final String? menuId;
  final String? menuTitle;
  final String crm;
  final String iikoHallTerminalId;

  Branch({
    required this.id,
    required this.shipperId,
    required this.name,
    required this.image,
    required this.phone,
    required this.isActive,
    required this.address,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
    required this.destination,
    required this.workHourStart,
    required this.workHourEnd,
    required this.jowiId,
    required this.iikoId,
    required this.iikoTerminalId,
    required this.fareId,
    required this.tgChatId,
    required this.geozoneId,
    required this.geozone,
    required this.ordersLimit,
    required this.radiusWithoutDeliveryPrice,
    required this.realTimeOrdersAmount,
    required this.fare,
    required this.menuId,
    required this.menuTitle,
    required this.crm,
    required this.iikoHallTerminalId,
  });

  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
      id: json['id'] ?? '',
      shipperId: json['shipper_id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'],
      phone: json['phone'] ?? '',
      isActive: json['is_active'] ?? false,
      address: json['address'] ?? '',
      location: LocationModel.fromJson(json['location'] ?? {}),
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      destination: json['destination'] ?? '',
      workHourStart: json['work_hour_start'] ?? '',
      workHourEnd: json['work_hour_end'] ?? '',
      jowiId: json['jowi_id'],
      iikoId: json['iiko_id'],
      iikoTerminalId: json['iiko_terminal_id'],
      fareId: json['fare_id'] ?? '',
      tgChatId: json['tg_chat_id'] ?? '',
      geozoneId: json['geozone_id'],
      geozone: json['geozone'],
      ordersLimit: json['orders_limit'] ?? '',
      radiusWithoutDeliveryPrice: json['radius_without_delivery_price'] ?? 0,
      realTimeOrdersAmount: json['real_time_orders_amount'] ?? 0,
      fare: json['fare'],
      menuId: json['menu_id'],
      menuTitle: json['menu_title'],
      crm: json['crm'] ?? '',
      iikoHallTerminalId: json['iiko_hall_terminal_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'shipper_id': shipperId,
      'name': name,
      'image': image,
      'phone': phone,
      'is_active': isActive,
      'address': address,
      'location': location.toJson(),
      'created_at': createdAt,
      'updated_at': updatedAt,
      'destination': destination,
      'work_hour_start': workHourStart,
      'work_hour_end': workHourEnd,
      'jowi_id': jowiId,
      'iiko_id': iikoId,
      'iiko_terminal_id': iikoTerminalId,
      'fare_id': fareId,
      'tg_chat_id': tgChatId,
      'geozone_id': geozoneId,
      'geozone': geozone,
      'orders_limit': ordersLimit,
      'radius_without_delivery_price': radiusWithoutDeliveryPrice,
      'real_time_orders_amount': realTimeOrdersAmount,
      'fare': fare,
      'menu_id': menuId,
      'menu_title': menuTitle,
      'crm': crm,
      'iiko_hall_terminal_id': iikoHallTerminalId,
    };
  }
}
