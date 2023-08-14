import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/data/models/category/category_with_products_model.dart';
import 'package:plaff_kebab/src/domain/repositories/category/category_repository.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(this.categoryRepository) : super(const CategoryState()) {
    on<GetCategoryEvent>(_getCategoryWithProducts);
  }

  final CategoryRepository categoryRepository;

  Future<void> _getCategoryWithProducts(
      GetCategoryEvent event, Emitter<CategoryState> emit) async {
    emit(GetCategoryLoading());
    final result = await categoryRepository.getCategoryWithProducts();
    result.fold(
      (l) {
        emit(GetCategoryErrosState(error: l.toString()));
      },
      (r) {
        emit(
          GetCategorySuccesState(categoryWithProductsList: r),
        );
      },
    );
  }
}
