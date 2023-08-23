part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState({
    this.select = 0,
    this.error = "",
    this.productIdModel,
    this.productStatus = ProductStatus.initial,
    this.modifiers = const [],
    this.combo = const [],
  });
  final String error;
  final ProductIdModel? productIdModel;
  final ProductStatus productStatus;
  final List<Modifier> modifiers;
  final List<Combo> combo;
  final int select;

  ProductState copyWith({
    int? select,
    String? error,
    ProductIdModel? productIdModel,
    ProductStatus? productStatus,
    List<Modifier>? modifiers,
    List<Combo>? combo,
  }) =>
      ProductState(
        select: select ?? this.select,
        combo: combo ?? this.combo,
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
        combo,
        select,
      ];
}

enum ProductStatus {
  initial,
  loading,
  success,
  error,
  getModifierSucces,
  getComboSucces
}

extension ProductStatusX on ProductStatus {
  bool get isInitial => this == ProductStatus.initial;

  bool get isLoading => this == ProductStatus.loading;

  bool get isSuccess => this == ProductStatus.success;

  bool get isError => this == ProductStatus.error;

  bool get getModifierSucces => this == ProductStatus.getModifierSucces;
  bool get getComboSucces => this == ProductStatus.getComboSucces;
}
