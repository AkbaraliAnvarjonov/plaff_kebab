import 'package:plaff_kebab/src/data/models/category/description_model.dart';

class SearchProduct {
  String id;
  String image;

  Description description;
  Description title;

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
      description: Description.fromJson(json['description']),
      title: Description.fromJson(json['title']),
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
