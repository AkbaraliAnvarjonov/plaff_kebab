import 'package:plaff_kebab/src/data/models/translations_model.dart';

class Variant {
  final bool isDivisible;
  final int inPrice;
  final int outPrice;
  final String currency;
  final String orderNo;
  final String count;
  final String id;
  final String image;
  final Translations title;
  final Translations description;

  Variant({
    required this.isDivisible,
    required this.inPrice,
    required this.outPrice,
    required this.currency,
    required this.orderNo,
    required this.count,
    required this.id,
    required this.image,
    required this.title,
    required this.description,
  });

 factory Variant.fromJson(Map<String, dynamic> json) {
  return Variant(
    isDivisible: json['is_divisible'] ?? false,
    inPrice: json['in_price'] ?? 0,
    outPrice: json['out_price'] ?? 0,
    currency: json['currency'] ?? '',
    orderNo: json['order_no'] ?? '',
    count: json['count'] ?? '',
    id: json['id'] ?? '',
    image: json['image'] ?? '',
    title: Translations.fromJson(json['title'] ?? {}),
    description: Translations.fromJson(json['description'] ?? {}),
  );
}

  Map<String, dynamic> toJson() => {
        'is_divisible': isDivisible,
        'in_price': inPrice,
        'out_price': outPrice,
        'currency': currency,
        'order_no': orderNo,
        'count': count,
        'id': id,
        'image': image,
        'title': title.toJson(),
        'description': description.toJson(),
      };

  Variant copyWith({
    bool? isDivisible,
    int? inPrice,
    int? outPrice,
    String? currency,
    String? orderNo,
    String? count,
    String? id,
    String? image,
    Translations? title,
    Translations? description,
  }) {
    return Variant(
      isDivisible: isDivisible ?? this.isDivisible,
      inPrice: inPrice ?? this.inPrice,
      outPrice: outPrice ?? this.outPrice,
      currency: currency ?? this.currency,
      orderNo: orderNo ?? this.orderNo,
      count: count ?? this.count,
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
