part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState({
    this.error = "",
    this.productIdModel,
    this.productStatus = ProductStatus.initial,
    this.modifiers = const [],
  });
  final String error;
  final ProductIdModel? productIdModel;
  final ProductStatus productStatus;
  final List<Modifier> modifiers;

  ProductState copyWith({
    String? error,
    ProductIdModel? productIdModel,
    ProductStatus? productStatus,
    List<Modifier>? modifiers,
  }) =>
      ProductState(
        error: error ?? this.error,
        productIdModel: productIdModel ?? this.productIdModel,
        productStatus: productStatus ?? this.productStatus,
        modifiers: modifiers ?? this.modifiers,
      );

  @override
  List<Object?> get props => [
        error,
        productIdModel,
        productStatus,
        modifiers,
      ];
}

enum ProductStatus {
  initial,
  loading,
  success,
  error,
  getModifierSucces,
}

extension ProductStatusX on ProductStatus {
  bool get isInitial => this == ProductStatus.initial;

  bool get isLoading => this == ProductStatus.loading;

  bool get isSuccess => this == ProductStatus.success;

  bool get isError => this == ProductStatus.error;

  bool get getModifierSucces => this == ProductStatus.getModifierSucces;
}
