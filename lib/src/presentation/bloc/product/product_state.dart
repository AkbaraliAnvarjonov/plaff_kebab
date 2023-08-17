part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState({
    this.error = "",
    this.productIdModel,
    this.productStatus = ProductStatus.initial,
  });
  final String error;
  final ProductIdModel? productIdModel;
  final ProductStatus productStatus;

  ProductState copyWith({
    String? error,
    ProductIdModel? productIdModel,
    ProductStatus? productStatus,
  }) =>
      ProductState(
        error: error ?? this.error,
        productIdModel: productIdModel ?? this.productIdModel,
        productStatus: productStatus ?? this.productStatus,
      );

  @override
  List<Object?> get props => [error, productIdModel, productStatus];
}

enum ProductStatus {
  initial,
  loading,
  success,
  error,
}

extension ProductStatusX on ProductStatus {
  bool get isInitial => this == ProductStatus.initial;

  bool get isLoading => this == ProductStatus.loading;

  bool get isSuccess => this == ProductStatus.success;

  bool get isError => this == ProductStatus.error;
}
