import 'package:plaff_kebab/src/data/models/product/modifier/modifier.dart';
import 'package:plaff_kebab/src/data/models/product/modifier/variant_model.dart';

class OrdersProducts {
  String? id;
  String? name;
  num? quantity;
  dynamic price;
  int? totalAmount;
  String? productId;
  String? externalProductId;
  String? description;
  String? type;
  List<Modifier>? modifiers;
  List<Variant>? variants;
  num? discountPrice;

  OrdersProducts({
    this.variants,
    this.modifiers,
    this.id,
    this.name,
    this.quantity,
    this.price,
    this.totalAmount,
    this.productId,
    this.externalProductId,
    this.description,
    this.type,
    this.discountPrice,
  });

  OrdersProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    totalAmount = json['total_amount'];
    productId = json['product_id'];
    externalProductId = json['external_product_id'];
    description = json['description'];
    type = json['type'];
    if (json['order_modifiers'] != null) {
      modifiers = <Modifier>[];
      json['order_modifiers'].forEach((v) {
        modifiers!.add(Modifier.fromJson(v));
      });
    }
    if (json['variants'] != null) {
      variants = <Variant>[];
      json['variants'].forEach((v) {
        variants!.add(Variant.fromJson(v));
      });
    }
    discountPrice = json['discount_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['type'] = type;
    data['price'] = price;
    data['product_id'] = productId;
    data['quantity'] = quantity;
    if (modifiers != null) {
      data['order_modifiers'] = modifiers!.map((v) => v.toJson()).toList();
    }
    if (variants != null) {
      data['variants'] = variants!.map((v) => v.toJson()).toList();
    }
    data['discount_price'] = discountPrice;
    return data;
  }
}
