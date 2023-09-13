import 'package:plaff_kebab/src/data/models/adress/location_model.dart';

class CustomerAddress {
  final String address;
  final String apartment;
  final String building;
  final String customerId;
  final String description;
  final String floor;
  final String id;
  final LocationModel location;
  final String name;

  CustomerAddress({
    required this.address,
    required this.apartment,
    required this.building,
    required this.customerId,
    required this.description,
    required this.floor,
    required this.id,
    required this.location,
    required this.name,
  });

  factory CustomerAddress.fromJson(Map<String, dynamic> json) {
    return CustomerAddress(
      address: json['address'] as String? ?? '',
      apartment: json['apartment'] as String? ?? '',
      building: json['building'] as String? ?? '',
      customerId: json['customer_id'] as String? ?? '',
      description: json['description'] as String? ?? '',
      floor: json['floor'] as String? ?? '',
      id: json['id'] as String? ?? '',
      location: LocationModel.fromJson(json['location']),
      name: json['name'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'apartment': apartment,
      'building': building,
      'customer_id': customerId,
      'description': description,
      'floor': floor,
      'location': location.toJson(),
      'name': name,
    };
  }
}
