import 'package:plaff_kebab/src/data/models/translations_model.dart';

class DiscountsModel {
  DiscountsModel({
    this.id,
    this.name,
    this.price,
    this.priority,
  });

  DiscountsModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'] != null ? Translations.fromJson(json['name']) : null;
    price = json['price'];
    priority = json['priority'];
  }

  String? id;
  Translations? name;
  num? price;
  num? priority;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (name != null) {
      map['name'] = name?.toJson();
    }
    map['price'] = price;
    map['priority'] = priority;
    return map;
  }
}
