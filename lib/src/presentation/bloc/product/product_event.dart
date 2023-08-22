part of 'product_bloc.dart';

abstract class ProductEvent {}

class GetProductEvent extends ProductEvent {
  final String id;
  GetProductEvent({required this.id});
}

class GetModifiers extends ProductEvent {
  final String productId;
  GetModifiers({required this.productId});
}

class PriceChange extends ProductEvent {
  final int price;
  final bool isPlus;
  ProductIdModel productIdModel;
  PriceChange({
    required this.price,
    required this.isPlus,
    required this.productIdModel,
  });
}
