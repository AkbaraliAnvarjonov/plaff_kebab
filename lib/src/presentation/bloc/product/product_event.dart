part of 'product_bloc.dart';

abstract class ProductEvent {}

class GetProductEvent extends ProductEvent {
  final String id;
  GetProductEvent({required this.id});
}
