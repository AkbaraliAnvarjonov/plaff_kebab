import 'package:plaff_kebab/src/data/models/translations_model.dart';

class Measurement {
  final String id;
  final String shipperId;
  final String slug;
  final Translations title;
  final String shortName;
  final String createdAt;
  final int accuracy;
  final String code;

  Measurement({
    required this.id,
    required this.shipperId,
    required this.slug,
    required this.title,
    required this.shortName,
    required this.createdAt,
    required this.accuracy,
    required this.code,
  });

  factory Measurement.fromJson(Map<String, dynamic> json) {
    return Measurement(
      id: json['id'] ?? '',
      shipperId: json['shipper_id'] ?? '',
      slug: json['slug'] ?? '',
      title: Translations.fromJson(json['title'] ?? {}),
      shortName: json['short_name'] ?? '',
      createdAt: json['created_at'] ?? '',
      accuracy: json['accuracy'] ?? 0,
      code: json['code'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'shipper_id': shipperId,
      'slug': slug,
      'title': title.toJson(),
      'short_name': shortName,
      'created_at': createdAt,
      'accuracy': accuracy,
      'code': code,
    };
  }
}
