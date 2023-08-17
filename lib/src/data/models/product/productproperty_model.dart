import 'package:plaff_kebab/src/data/models/product/options_model.dart';

class ProductProperty {
  final String id;
  final String title;
  final List<Option> options;

  ProductProperty({
    required this.id,
    required this.title,
    required this.options,
  });

  factory ProductProperty.fromJson(Map<String, dynamic> json) {
    return ProductProperty(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      options: (json['options'] as List<dynamic>?)
              ?.map<Option>((option) => Option.fromJson(option))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'options': options.map((option) => option.toJson()).toList(),
    };
  }
}
