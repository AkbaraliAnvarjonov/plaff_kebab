import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/data/models/product/modifier/modifier.dart';
import 'package:plaff_kebab/src/data/models/product/product_model.dart';
import 'package:plaff_kebab/src/domain/repositories/product/product_repository.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(this.productRepository) : super(const ProductState()) {
    on<GetProductEvent>(_getProductwithId);
    on<GetModifiers>(_getModifiers);
  }

  final ProductRepository productRepository;

  Future<void> _getProductwithId(
      GetProductEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(productStatus: ProductStatus.loading));
    final result = await productRepository.getProductwithId(id: event.id);
    result.fold(
      (l) {
        emit(state.copyWith(
            error: l.props[0] as String, productStatus: ProductStatus.error));
      },
      (r) {
        if (r.hasModifier) {
          emit(state.copyWith(productIdModel: r));
          add(GetModifiers(productId: r.id));
        } else {
          emit(state.copyWith(
              productIdModel: r, productStatus: ProductStatus.success));
        }
      },
    );
  }

  _getModifiers(GetModifiers event, Emitter<ProductState> emit) async {
    final result = await productRepository.getModifiers(id: event.productId);
    result.fold(
      (l) {
        emit(state.copyWith(
            error: l.props[0] as String, productStatus: ProductStatus.error));
      },
      (r) {
        {
          emit(state.copyWith(
              modifiers: r, productStatus: ProductStatus.getModifierSucces));
        }
      },
    );
  }
}
