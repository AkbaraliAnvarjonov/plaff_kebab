import 'package:plaff_kebab/src/data/models/translations_model.dart';
import 'package:plaff_kebab/src/data/models/category/product_model.dart';

class CategoryWithProducts {
  final String id;
  final String slug;
  final String parentId;
  final String image;
  final Translations title;
  final Translations description;
  final String orderNo;
  final bool active;
  final List<ProductModel> products;

  CategoryWithProducts({
    required this.id,
    required this.slug,
    required this.parentId,
    required this.image,
    required this.description,
    required this.title,
    required this.orderNo,
    required this.active,
    required this.products,
  });
  factory CategoryWithProducts.fromJson(Map<String, dynamic> json) {
    return CategoryWithProducts(
      id: json['id'] ?? '',
      slug: json['slug'] ?? '',
      parentId: json['parent_id'],
      image: json['image'] ?? '',
      description: Translations.fromJson(json['description']),
      title: Translations.fromJson(json['title']),
      orderNo: json['order_no'] ?? '',
      active: json['active'] ?? false,
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => ProductModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': slug,
      'parentId': parentId,
      'image': image,
      'description': description.toJson(),
      'title': title.toJson(),
      'orderNo': orderNo,
      'active': active,
      'products': products.map((e) => e.toJson()).toList(),
    };
  }

  CategoryWithProducts copyWith({
    String? id,
    String? slug,
    String? parentId,
    String? image,
    Translations? description,
    Translations? title,
    String? orderNo,
    bool? active,
    List<ProductModel>? products,
  }) =>
      CategoryWithProducts(
        id: id ?? this.id,
        slug: slug ?? this.slug,
        parentId: parentId ?? this.parentId,
        image: image ?? this.image,
        description: description ?? this.description,
        title: title ?? this.title,
        orderNo: orderNo ?? this.orderNo,
        active: active ?? this.active,
        products: products ?? this.products,
      );
}
