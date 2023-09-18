import 'package:plaff_kebab/src/data/models/translations_model.dart';

class OrdersVariants {
  String? groupId;
  String? variantId;
  Translations? variantName;
  int? quantity;

  OrdersVariants(
      {this.groupId, this.variantId, this.variantName, this.quantity});

  OrdersVariants.fromJson(Map<String, dynamic> json) {
    groupId = json['group_id'];
    variantId = json['variant_id'];
    variantName = json['variant_name'] != null
        ? Translations.fromJson(json['variant_name'])
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
