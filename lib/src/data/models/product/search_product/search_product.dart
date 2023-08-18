import 'package:plaff_kebab/src/data/models/translations_model.dart';

class SearchProduct {
  String id;
  String image;

  Translations description;
  Translations title;

  SearchProduct({
    required this.id,
    required this.image,
    required this.description,
    required this.title,
  });

  factory SearchProduct.fromJson(Map<String, dynamic> json) {
    return SearchProduct(
      id: json['id'] ?? '',
      image: json['image'] ?? '',
      description: Translations.fromJson(json['description']),
      title: Translations.fromJson(json['title']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'description': description,
      'title': title,
    };
  }
}
