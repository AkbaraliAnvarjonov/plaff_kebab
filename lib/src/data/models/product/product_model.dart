import 'package:plaff_kebab/src/data/models/translations_model.dart';
import 'package:plaff_kebab/src/data/models/product/category_model.dart';
import 'package:plaff_kebab/src/data/models/product/measurement_model.dart';
import 'package:plaff_kebab/src/data/models/product/productproperty_model.dart';
import 'package:plaff_kebab/src/data/models/product/property_model.dart';
import 'package:plaff_kebab/src/data/models/product/rate_model.dart';
import 'package:plaff_kebab/src/data/models/product/variant_product.dart';

class ProductIdModel {
  final String id;
  final String slug;
  final Translations title;
  final String code;
  final Translations description;
  final List<Category> categories;
  final bool isDivisible;
  final String count;
  final List<String> tags;
  final Measurement measurement;
  final Rate rate;
  final int inPrice;
  final int outPrice;
  final String image;
  final List<String> gallery;
  final List<String> favourites;
  final bool active;
  final String order;
  final String createdAt;
  final String iikoId;
  final String jowiId;
  final String shipperId;
  final List<String> priceChangers;
  final String currency;
  final String type;
  final List<Property> properties;
  final List<ProductProperty> productProperties;
  final String iikoSourceActionId;
  final String iikoGroupId;
  final bool activeInMenu;
  final bool offAlways;
  final String fromTime;
  final String toTime;
  final String ikpu;
  final String packageCode;
  final List<VariantProduct> variantProducts;
  final String parentId;
  final bool hasModifier;
  final String rkeeperId;
  final String crmName;
  final String posterId;

  ProductIdModel({
    required this.id,
    required this.slug,
    required this.title,
    required this.code,
    required this.description,
    required this.categories,
    required this.isDivisible,
    required this.count,
    required this.tags,
    required this.measurement,
    required this.rate,
    required this.inPrice,
    required this.outPrice,
    required this.image,
    required this.gallery,
    required this.favourites,
    required this.active,
    required this.order,
    required this.createdAt,
    required this.iikoId,
    required this.jowiId,
    required this.shipperId,
    required this.priceChangers,
    required this.currency,
    required this.type,
    required this.properties,
    required this.productProperties,
    required this.iikoSourceActionId,
    required this.iikoGroupId,
    required this.activeInMenu,
    required this.offAlways,
    required this.fromTime,
    required this.toTime,
    required this.ikpu,
    required this.packageCode,
    required this.variantProducts,
    required this.parentId,
    required this.hasModifier,
    required this.rkeeperId,
    required this.crmName,
    required this.posterId,
  });

  factory ProductIdModel.fromJson(Map<String, dynamic> json) {
    return ProductIdModel(
      id: json['id'] ?? '',
      slug: json['slug'] ?? '',
      title: Translations.fromJson(json['title'] ?? {}),
      code: json['code'] ?? '',
      description: Translations.fromJson(json['description'] ?? {}),
      categories: (json['categories'] as List<dynamic>?)
              ?.map<Category>((category) => Category.fromJson(category))
              .toList() ??
          [],
      isDivisible: json['is_divisible'] ?? false,
      count: json['count'] ?? '',
      tags: (json['tags'] as List<dynamic>?)
              ?.map<String>((tag) => tag.toString())
              .toList() ??
          [],
      measurement: Measurement.fromJson(json['measurement'] ?? {}),
      rate: Rate.fromJson(json['rate'] ?? {}),
      inPrice: json['in_price'] ?? 0,
      outPrice: json['out_price'] ?? 0,
      image: json['image'] ?? '',
      gallery: (json['gallery'] as List<dynamic>?)
              ?.map<String>((image) => image.toString())
              .toList() ??
          [],
      favourites: (json['favourites'] as List<dynamic>?)
              ?.map<String>((fav) => fav.toString())
              .toList() ??
          [],
      active: json['active'] ?? false,
      order: json['order'] ?? '',
      createdAt: json['created_at'] ?? '',
      iikoId: json['iiko_id'] ?? '',
      jowiId: json['jowi_id'] ?? '',
      shipperId: json['shipper_id'] ?? '',
      priceChangers: (json['price_changers'] as List<dynamic>?)
              ?.map<String>((changer) => changer.toString())
              .toList() ??
          [],
      currency: json['currency'] ?? '',
      type: json['type'] ?? '',
      properties: (json['properties'] as List<dynamic>?)
              ?.map<Property>((property) => Property.fromJson(property))
              .toList() ??
          [],
      productProperties: (json['product_property'] as List<dynamic>?)
              ?.map<ProductProperty>((prop) => ProductProperty.fromJson(prop))
              .toList() ??
          [],
      iikoSourceActionId: json['iiko_source_action_id'] ?? '',
      iikoGroupId: json['iiko_group_id'] ?? '',
      activeInMenu: json['active_in_menu'] ?? false,
      offAlways: json['off_always'] ?? false,
      fromTime: json['from_time'] ?? '',
      toTime: json['to_time'] ?? '',
      ikpu: json['ikpu'] ?? '',
      packageCode: json['package_code'] ?? '',
      variantProducts: (json['variant_products'] as List<dynamic>?)
              ?.map<VariantProduct>(
                  (variant) => VariantProduct.fromJson(variant))
              .toList() ??
          [],
      parentId: json['parent_id'] ?? '',
      hasModifier: json['has_modifier'] ?? false,
      rkeeperId: json['rkeeper_id'] ?? '',
      crmName: json['crm_name'] ?? '',
      posterId: json['poster_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': slug,
      'title': title.toJson(),
      'code': code,
      'description': description.toJson(),
      'categories': categories.map((category) => category.toJson()).toList(),
      'is_divisible': isDivisible,
      'count': count,
      'tags': tags,
      'measurement': measurement.toJson(),
      'rate': rate.toJson(),
      'in_price': inPrice,
      'out_price': outPrice,
      'image': image,
      'gallery': gallery,
      'favourites': favourites,
      'active': active,
      'order': order,
      'created_at': createdAt,
      'iiko_id': iikoId,
      'jowi_id': jowiId,
      'shipper_id': shipperId,
      'price_changers': priceChangers,
      'currency': currency,
      'type': type,
      'properties': properties.map((property) => property.toJson()).toList(),
      'product_property':
          productProperties.map((prop) => prop.toJson()).toList(),
      'iiko_source_action_id': iikoSourceActionId,
      'iiko_group_id': iikoGroupId,
      'active_in_menu': activeInMenu,
      'off_always': offAlways,
      'from_time': fromTime,
      'to_time': toTime,
      'ikpu': ikpu,
      'package_code': packageCode,
      'variant_products':
          variantProducts.map((variant) => variant.toJson()).toList(),
      'parent_id': parentId,
      'has_modifier': hasModifier,
      'rkeeper_id': rkeeperId,
      'crm_name': crmName,
      'poster_id': posterId,
    };
  }

  ProductIdModel copyWith({
    String? id,
    String? slug,
    Translations? title,
    String? code,
    Translations? description,
    List<Category>? categories,
    bool? isDivisible,
    String? count,
    List<String>? tags,
    Measurement? measurement,
    Rate? rate,
    int? inPrice,
    int? outPrice,
    String? image,
    List<String>? gallery,
    List<String>? favourites,
    bool? active,
    String? order,
    String? createdAt,
    String? iikoId,
    String? jowiId,
    String? shipperId,
    List<String>? priceChangers,
    String? currency,
    String? type,
    List<Property>? properties,
    List<ProductProperty>? productProperties,
    String? iikoSourceActionId,
    String? iikoGroupId,
    bool? activeInMenu,
    bool? offAlways,
    String? fromTime,
    String? toTime,
    String? ikpu,
    String? packageCode,
    List<VariantProduct>? variantProducts,
    String? parentId,
    bool? hasModifier,
    String? rkeeperId,
    String? crmName,
    String? posterId,
  }) {
    return ProductIdModel(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      title: title ?? this.title,
      code: code ?? this.code,
      description: description ?? this.description,
      categories: categories ?? this.categories,
      isDivisible: isDivisible ?? this.isDivisible,
      count: count ?? this.count,
      tags: tags ?? this.tags,
      measurement: measurement ?? this.measurement,
      rate: rate ?? this.rate,
      inPrice: inPrice ?? this.inPrice,
      outPrice: outPrice ?? this.outPrice,
      image: image ?? this.image,
      gallery: gallery ?? this.gallery,
      favourites: favourites ?? this.favourites,
      active: active ?? this.active,
      order: order ?? this.order,
      createdAt: createdAt ?? this.createdAt,
      iikoId: iikoId ?? this.iikoId,
      jowiId: jowiId ?? this.jowiId,
      shipperId: shipperId ?? this.shipperId,
      priceChangers: priceChangers ?? this.priceChangers,
      currency: currency ?? this.currency,
      type: type ?? this.type,
      properties: properties ?? this.properties,
      productProperties: productProperties ?? this.productProperties,
      iikoSourceActionId: iikoSourceActionId ?? this.iikoSourceActionId,
      iikoGroupId: iikoGroupId ?? this.iikoGroupId,
      activeInMenu: activeInMenu ?? this.activeInMenu,
      offAlways: offAlways ?? this.offAlways,
      fromTime: fromTime ?? this.fromTime,
      toTime: toTime ?? this.toTime,
      ikpu: ikpu ?? this.ikpu,
      packageCode: packageCode ?? this.packageCode,
      variantProducts: variantProducts ?? this.variantProducts,
      parentId: parentId ?? this.parentId,
      hasModifier: hasModifier ?? this.hasModifier,
      rkeeperId: rkeeperId ?? this.rkeeperId,
      crmName: crmName ?? this.crmName,
      posterId: posterId ?? this.posterId,
    );
  }
}
