import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/data/models/product/combo/combo_model.dart';
import 'package:plaff_kebab/src/data/models/product/modifier/modifier.dart';
import 'package:plaff_kebab/src/data/models/product/product_model.dart';
import 'package:plaff_kebab/src/domain/repositories/product/product_repository.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(this.productRepository) : super(const ProductState()) {
    on<GetProductEvent>(_getProductwithId);
    on<GetModifiers>(_getModifiers);
    on<PriceChange>(_priceChange);
    on<GetCombo>(_getCombo);
    on<ChangeCount>(_changeCount);
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
        r.count = "1";
        emit(state.copyWith(productIdModel: r));
        if (r.hasModifier) {
          emit(state.copyWith(productIdModel: r));
          add(GetModifiers(productId: r.id));
        } else if (r.type == 'combo') {
          add(GetCombo(id: r.id));
        } else {
          emit(state.copyWith(productStatus: ProductStatus.success));
        }
      },
    );
  }

  _getModifiers(GetModifiers event, Emitter<ProductState> emit) async {
    final result = await productRepository.getModifiers(id: event.productId);
    result.fold(
      (error) {
        emit(state.copyWith(
            error: error.props[0] as String,
            productStatus: ProductStatus.error));
      },
      (modifiers) {
        {
          emit(state.copyWith(
              modifiers: modifiers,
              productStatus: ProductStatus.getModifierSucces));
        }
      },
    );
  }

  _getCombo(GetCombo event, Emitter<ProductState> emit) async {
    final result = await productRepository.getCombo(id: event.id);

    result.fold(
      (error) => emit(state.copyWith(
        error: error.props[0] as String,
        productStatus: ProductStatus.error,
      )),
      (combo) => emit(state.copyWith(
        combo: combo,
        productStatus: ProductStatus.getComboSucces,
      )),
    );
  }

  _priceChange(PriceChange event, Emitter<ProductState> emit) async {
    final updatedProduct = event.productIdModel.copyWith(
      outPrice: event.isPlus
          ? event.productIdModel.outPrice + event.price
          : event.productIdModel.outPrice - event.price,
    );

    emit(state.copyWith(
      productIdModel: updatedProduct,
      productStatus: ProductStatus.getModifierSucces,
    ));
  }

  _changeCount(ChangeCount event, Emitter<ProductState> emit) {
    int count = int.parse(event.productIdModel.count);

    count += event.isPlus ? 1 : -1;

    event.productIdModel.count = count.toString();
    emit(state.copyWith(productIdModel: event.productIdModel));
  }
}
