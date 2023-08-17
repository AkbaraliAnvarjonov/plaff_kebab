import 'package:plaff_kebab/src/data/models/category/description_model.dart';

class Category {
  final String id;
  final String slug;
  final Description title;
  final Description description;
  final String parentId;
  final String image;
  final List<String> propertyIds;
  final bool active;
  final String orderNo;
  final String createdAt;
  final String shipperId;
  final String iikoId;
  final String jowiId;

  Category({
    required this.id,
    required this.slug,
    required this.title,
    required this.description,
    required this.parentId,
    required this.image,
    required this.propertyIds,
    required this.active,
    required this.orderNo,
    required this.createdAt,
    required this.shipperId,
    required this.iikoId,
    required this.jowiId,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? '',
      slug: json['slug'] ?? '',
      title: Description.fromJson(json['title'] ?? {}),
      description: Description.fromJson(json['description'] ?? {}),
      parentId: json['parent_id'] ?? '',
      image: json['image'] ?? '',
      propertyIds: (json['property_ids'] as List<dynamic>?)
              ?.map<String>((propertyId) => propertyId.toString())
              .toList() ??
          [],
      active: json['active'] ?? false,
      orderNo: json['order_no'] ?? '',
      createdAt: json['created_at'] ?? '',
      shipperId: json['shipper_id'] ?? '',
      iikoId: json['iiko_id'] ?? '',
      jowiId: json['jowi_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': slug,
      'title': title.toJson(),
      'description': description.toJson(),
      'parent_id': parentId,
      'image': image,
      'property_ids': propertyIds,
      'active': active,
      'order_no': orderNo,
      'created_at': createdAt,
      'shipper_id': shipperId,
      'iiko_id': iikoId,
      'jowi_id': jowiId,
    };
  }
}
