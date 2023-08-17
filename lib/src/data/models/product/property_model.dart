import 'package:plaff_kebab/src/data/models/category/description_model.dart';
import 'package:plaff_kebab/src/data/models/product/options_model.dart';

class Property {
  final String id;
  final String slug;
  final Description title;
  final Description description;
  final String createdAt;
  final String shipperId;
  final bool active;
  final String orderNo;
  final List<Option> options;

  Property({
    required this.id,
    required this.slug,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.shipperId,
    required this.active,
    required this.orderNo,
    required this.options,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'] ?? '',
      slug: json['slug'] ?? '',
      title: Description.fromJson(json['title'] ?? {}),
      description: Description.fromJson(json['description'] ?? {}),
      createdAt: json['created_at'] ?? '',
      shipperId: json['shipper_id'] ?? '',
      active: json['active'] ?? false,
      orderNo: json['order_no'] ?? '',
      options: (json['options'] as List<dynamic>?)
              ?.map<Option>((option) => Option.fromJson(option))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': slug,
      'title': title.toJson(),
      'description': description.toJson(),
      'created_at': createdAt,
      'shipper_id': shipperId,
      'active': active,
      'order_no': orderNo,
      'options': options.map((option) => option.toJson()).toList(),
    };
  }
}
