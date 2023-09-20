import 'package:plaff_kebab/src/data/models/translations_model.dart';

class ProductModel {
  final String id;
  final int outPrice;
  final String currency;
  final String string;
  final String type;
  final List<String> categories;
  final String brandId;
  final String rateId;
  final String image;
  final bool activeInMenu;
  final bool hasModifier;
  final String fromTime;
  final String toTime;
  final bool offAlways;
  final dynamic gallery;
  final Translations title;
  final Translations description;
  final bool active;
  final String iikoId;
  final String jowiId;
  final dynamic discounts;

  ProductModel({
    required this.id,
    required this.outPrice,
    required this.currency,
    required this.string,
    required this.type,
    required this.categories,
    required this.brandId,
    required this.rateId,
    required this.image,
    required this.activeInMenu,
    required this.hasModifier,
    required this.fromTime,
    required this.toTime,
    required this.offAlways,
    required this.gallery,
    required this.title,
    required this.description,
    required this.active,
    required this.iikoId,
    required this.jowiId,
    required this.discounts,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      outPrice: json['out_price'] is int ? json['out_price'] : 0,
      currency: json['currency'] ?? '',
      string: json['string'] ?? '',
      type: json['type'] ?? '',
      categories: (json['categories'] as List<dynamic>)
          .map<String>((e) => e.toString())
          .toList(),
      brandId: json['brand_id'] ?? '',
      rateId: json['rate_id'] ?? '',
      image: json['image'] ?? '',
      activeInMenu: json['active_in_menu'] ?? false,
      hasModifier: json['has_modifier'] ?? false,
      fromTime: json['from_time'] ?? '',
      toTime: json['to_time'] ?? '',
      offAlways: json['off_always'] ?? false,
      gallery: json['gallery'] ?? '',
      title: Translations.fromJson(json['title']),
      description: Translations.fromJson(json['description']),
      active: json['active'] ?? false,
      iikoId: json['iikoIiiko_idd'] ?? '',
      jowiId: json['jowi_id'] ?? '',
      discounts: json['discounts'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'outPrice': outPrice,
      'currency': currency,
      'string': string,
      'type': type,
      'categories': categories,
      'brandId': brandId,
      'rateId': rateId,
      'image': image,
      'activeInMenu': activeInMenu,
      'hasModifier': hasModifier,
      'fromTime': fromTime,
      'toTime': toTime,
      'offAlways': offAlways,
      'gallery': gallery,
      'title': title.toJson(),
      'description': description.toJson(),
      'active': active,
      'iikoId': iikoId,
      'jowiId': jowiId,
      'discounts': discounts,
    };
  }

  ProductModel copyWith({
    String? id,
    int? outPrice,
    String? currency,
    String? string,
    String? type,
    List<String>? categories,
    String? brandId,
    String? rateId,
    String? image,
    bool? activeInMenu,
    bool? hasModifier,
    String? fromTime,
    String? toTime,
    bool? offAlways,
    dynamic gallery,
    Translations? title,
    Translations? description,
    bool? active,
    String? iikoId,
    String? jowiId,
    dynamic discounts,
  }) =>
      ProductModel(
        id: id ?? this.id,
        outPrice: outPrice ?? this.outPrice,
        currency: currency ?? this.currency,
        string: string ?? this.string,
        type: type ?? this.type,
        categories: categories ?? this.categories,
        brandId: brandId ?? this.brandId,
        rateId: rateId ?? this.rateId,
        image: image ?? this.image,
        activeInMenu: activeInMenu ?? this.activeInMenu,
        hasModifier: hasModifier ?? this.hasModifier,
        fromTime: fromTime ?? this.fromTime,
        toTime: toTime ?? this.toTime,
        offAlways: offAlways ?? this.offAlways,
        gallery: gallery ?? this.gallery,
        title: title ?? this.title,
        description: description ?? this.description,
        active: active ?? this.active,
        iikoId: iikoId ?? this.iikoId,
        jowiId: jowiId ?? this.jowiId,
        discounts: discounts ?? this.discounts,
      );
}
