import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/data/models/product/product_model.dart';
import 'package:plaff_kebab/src/domain/repositories/product/product_repository.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(this.productRepository) : super(const ProductState()) {
    on<GetProductEvent>(_getProductwithId);
  }

  final ProductRepository productRepository;

  Future<void> _getProductwithId(
      GetProductEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(productStatus: ProductStatus.loading));
    final result = await productRepository.getProductwithId(id: event.id);
    result.fold(
      (l) {
        print(l);
        emit(state.copyWith(
            error: l.toString(), productStatus: ProductStatus.error));
      },
      (r) {
        emit(state.copyWith(
            productIdModel: r, productStatus: ProductStatus.success));
      },
    );
  }
}
