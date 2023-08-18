import 'package:plaff_kebab/src/data/models/translations_model.dart';

class Rate {
  final String? id;
  final String? slug;
  final Translations title;
  final String shipperId;
  final String? shortName;
  final String? createdAt;
  final String? updatedAt;

  Rate({
    required this.id,
    required this.slug,
    required this.title,
    required this.shipperId,
    required this.shortName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Rate.fromJson(Map<String, dynamic> json) {
    return Rate(
      id: json['id'] ?? '',
      slug: json['slug'] ?? '',
      title: Translations.fromJson(json['title'] ?? {}),
      shipperId: json['shipper_id'] ?? '',
      shortName: json['short_name'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': slug,
      'title': title.toJson(),
      'shipper_id': shipperId,
      'short_name': shortName,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
