import 'package:plaff_kebab/src/data/models/product/modifier/variant_model.dart';
import 'package:plaff_kebab/src/data/models/translations_model.dart';

class Modifier {
  final String id;
  final String type;
  final String fromProductId;
  final String toProductId;
  final bool active;
  final String order;
  final String createdAt;
  final String shipperId;
  final int minAmount;
  final int maxAmount;
  final bool isCompulsory;
  final bool isCheckbox;
  final bool addToPrice;
  final Translations name;
  final Translations categoryName;
  final String price;
  final String code;
  final List<Variant> variants;

  Modifier({
    required this.id,
    required this.type,
    required this.fromProductId,
    required this.toProductId,
    required this.active,
    required this.order,
    required this.createdAt,
    required this.shipperId,
    required this.minAmount,
    required this.maxAmount,
    required this.isCompulsory,
    required this.isCheckbox,
    required this.addToPrice,
    required this.name,
    required this.categoryName,
    required this.price,
    required this.code,
    required this.variants,
  });

  factory Modifier.fromJson(Map<String, dynamic> json) {
    return Modifier(
      id: json['id'] ?? '',
      type: json['type'] ?? '',
      fromProductId: json['from_product_id'] ?? '',
      toProductId: json['to_product_id'] ?? '',
      active: json['active'] ?? false,
      order: json['order'] ?? '',
      createdAt: json['created_at'] ?? '',
      shipperId: json['shipper_id'] ?? '',
      minAmount: json['min_amount'] ?? 0,
      maxAmount: json['max_amount'] ?? 0,
      isCompulsory: json['is_compulsory'] ?? false,
      isCheckbox: json['is_checkbox'] ?? false,
      addToPrice: json['add_to_price'] ?? false,
      name: Translations.fromJson(json['name'] ?? {}),
      categoryName: Translations.fromJson(json['category_name'] ?? {}),
      price: json['price'] ?? '',
      code: json['code'] ?? '',
      variants: (json['variants'] as List? ?? [])
          .map((variantJson) => Variant.fromJson(variantJson ?? {}))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'from_product_id': fromProductId,
        'to_product_id': toProductId,
        'active': active,
        'order': order,
        'created_at': createdAt,
        'shipper_id': shipperId,
        'min_amount': minAmount,
        'max_amount': maxAmount,
        'is_compulsory': isCompulsory,
        'is_checkbox': isCheckbox,
        'add_to_price': addToPrice,
        'name': name.toJson(),
        'category_name': categoryName.toJson(),
        'price': price,
        'code': code,
        'variants': variants.map((variant) => variant.toJson()).toList(),
      };

  Modifier copyWith({
    String? id,
    String? type,
    String? fromProductId,
    String? toProductId,
    bool? active,
    String? order,
    String? createdAt,
    String? shipperId,
    int? minAmount,
    int? maxAmount,
    bool? isCompulsory,
    bool? isCheckbox,
    bool? addToPrice,
    Translations? name,
    Translations? categoryName,
    String? price,
    String? code,
    List<Variant>? variants,
  }) {
    return Modifier(
      id: id ?? this.id,
      type: type ?? this.type,
      fromProductId: fromProductId ?? this.fromProductId,
      toProductId: toProductId ?? this.toProductId,
      active: active ?? this.active,
      order: order ?? this.order,
      createdAt: createdAt ?? this.createdAt,
      shipperId: shipperId ?? this.shipperId,
      minAmount: minAmount ?? this.minAmount,
      maxAmount: maxAmount ?? this.maxAmount,
      isCompulsory: isCompulsory ?? this.isCompulsory,
      isCheckbox: isCheckbox ?? this.isCheckbox,
      addToPrice: addToPrice ?? this.addToPrice,
      name: name ?? this.name,
      categoryName: categoryName ?? this.categoryName,
      price: price ?? this.price,
      code: code ?? this.code,
      variants: variants ?? this.variants,
    );
  }
}
