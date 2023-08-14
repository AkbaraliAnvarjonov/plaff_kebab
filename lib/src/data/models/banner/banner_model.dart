import 'package:plaff_kebab/src/data/models/category/description_model.dart';

class BannerModel {
  final String id;
  final Description title;
  final String position;
  final String image;
  final String url;
  final bool active;
  final String createdAt;
  final String updatedAt;
  final String shipperId;
  final String about;

  BannerModel({
    required this.id,
    required this.title,
    required this.position,
    required this.image,
    required this.url,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.shipperId,
    required this.about,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'] ?? '',
      title: Description.fromJson(json["title"]),
      position: json['position'] ?? '',
      image: json['image'] ?? '',
      url: json['url'] ?? '',
      active: json['active'] ?? false,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      shipperId: json['shipper_id'] ?? '',
      about: json['about'] ?? '',
    );
  }
}
