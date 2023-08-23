import 'package:plaff_kebab/src/data/models/product/modifier/variant_model.dart';
import 'package:plaff_kebab/src/data/models/translations_model.dart';

class Combo {
  final String id;
  final String comboId;
  final String shipperId;
  final String slug;
  final int order;
  final String type;
  final List<Variant> variants;
  final int quantity;
  final Translations title;

  Combo({
    required this.id,
    required this.comboId,
    required this.shipperId,
    required this.slug,
    required this.order,
    required this.type,
    required this.variants,
    required this.quantity,
    required this.title,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "combo_id": comboId,
      "shipper_id": shipperId,
      "slug": slug,
      "order": order,
      "type": type,
      "variants": variants.map((variant) => variant.toJson()).toList(),
      "quantity": quantity,
      "title": title,
    };
  }

  factory Combo.fromJson(Map<String, dynamic> json) {
    return Combo(
        id: json["id"] ?? '',
        comboId: json["combo_id"] ?? '',
        shipperId: json["shipper_id"] ?? '',
        slug: json["slug"] ?? '',
        order: json["order"] ?? 0,
        type: json["type"] ?? '',
        variants: (json["variants"] as List<dynamic>?)
                ?.map((variantJson) => Variant.fromJson(variantJson))
                .toList() ??
            [],
        quantity: json["quantity"] ?? 0,
        title: Translations.fromJson(json['title'] ?? {}));
  }

  Combo copyWith({
    String? id,
    String? comboId,
    String? shipperId,
    String? slug,
    int? order,
    String? type,
    List<Variant>? variants,
    int? quantity,
    Translations? title,
  }) {
    return Combo(
      id: id ?? this.id,
      comboId: comboId ?? this.comboId,
      shipperId: shipperId ?? this.shipperId,
      slug: slug ?? this.slug,
      order: order ?? this.order,
      type: type ?? this.type,
      variants: variants ?? this.variants,
      quantity: quantity ?? this.quantity,
      title: title ?? this.title,
    );
  }
}
