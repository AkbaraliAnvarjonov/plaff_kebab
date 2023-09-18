import 'package:plaff_kebab/src/data/models/translations_model.dart';

class OrdersProductsOndemand {
  String? id;
  String? name;
  num? quantity;
  dynamic price;
  int? totalAmount;
  String? productId;
  String? externalProductId;
  String? description;
  String? type;
  List<ModifiersOnDemand>? modifiers;
  List<OrdersVariantsOndemand>? variants;

  OrdersProductsOndemand({
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
  });

  OrdersProductsOndemand.fromJson(Map<String, dynamic> json) {
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
      modifiers = <ModifiersOnDemand>[];
      json['order_modifiers'].forEach((v) {
        modifiers!.add(ModifiersOnDemand.fromJson(v));
      });
    }
    if (json['variants'] != null) {
      variants = <OrdersVariantsOndemand>[];
      json['variants'].forEach((v) {
        variants!.add(OrdersVariantsOndemand.fromJson(v));
      });
    }
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
    return data;
  }
}

class OrdersVariantsOndemand {
  String? groupId;
  String? variantId;
  VariantName? variantName;
  int? quantity;

  OrdersVariantsOndemand(
      {this.groupId, this.variantId, this.variantName, this.quantity});

  OrdersVariantsOndemand.fromJson(Map<String, dynamic> json) {
    groupId = json['group_id'];
    variantId = json['variant_id'];
    variantName = json['variant_name'] != null
        ? VariantName.fromJson(json['variant_name'])
        : null;
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['group_id'] = groupId;
    data['variant_id'] = variantId;
    if (variantName != null) {
      data['variant_name'] = variantName?.toJson();
    }
    data['quantity'] = quantity;
    return data;
  }
}

class VariantName {
  String? uz;
  String? ru;
  String? en;

  VariantName({this.uz, this.ru, this.en});

  VariantName.fromJson(Map<String, dynamic> json) {
    uz = json['uz'];
    ru = json['ru'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uz'] = uz;
    data['ru'] = ru;
    data['en'] = en;
    return data;
  }
}

class ModifiersOnDemand {
  String? modifierId;
  Translations? modifierName;
  String? modifierQuantity;
  String? modifiersPrice;
  String? parentId;

  ModifiersOnDemand(
      {this.modifierId,
      this.modifierName,
      this.modifierQuantity,
      this.modifiersPrice,
      this.parentId});

  ModifiersOnDemand.fromJson(Map<String, dynamic> json) {
    modifierId = json['modifier_id'];
    modifierName = json['modifier_name'] != null
        ? Translations.fromJson(json['modifier_name'])
        : null;
    modifierQuantity = json['modifier_quantity'];
    modifiersPrice = json['modifier_price'];
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['modifier_id'] = modifierId;
    if (modifierName != null) {
      data['modifier_name'] = modifierName?.toJson();
    }
    data['modifier_quantity'] = modifierQuantity;
    data['modifier_price'] = modifiersPrice;
    data['parent_id'] = parentId;
    return data;
  }
}
