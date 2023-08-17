import 'package:plaff_kebab/src/data/models/product/property_options_model.dart';

class VariantProduct {
  final String id;
  final String parentId;
  final List<PropertyOption> propertyOptions;

  VariantProduct({
    required this.id,
    required this.parentId,
    required this.propertyOptions,
  });

  factory VariantProduct.fromJson(Map<String, dynamic> json) {
    return VariantProduct(
      id: json['id'] ?? '',
      parentId: json['parent_id'] ?? '',
      propertyOptions: (json['property_options'] as List<dynamic>?)
              ?.map<PropertyOption>((option) => PropertyOption.fromJson(option))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'parent_id': parentId,
      'property_options':
          propertyOptions.map((option) => option.toJson()).toList(),
    };
  }
}
