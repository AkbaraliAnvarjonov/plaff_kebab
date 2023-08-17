import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/data/models/category/category_with_products_model.dart';
import 'package:plaff_kebab/src/data/models/product/search_product/search_product.dart';
import 'package:plaff_kebab/src/domain/repositories/category/category_repository.dart';
import 'package:plaff_kebab/src/domain/repositories/product/product_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.categoryRepository, this.productRepository)
      : super(const HomeState()) {
    on<HomeScroll>(_onHomeScroll);
    on<GetCategoryEvent>(_getCategoryWithProducts);
    on<CategorySelectEvent>(_selectCategory);
    on<SearchEvent>(_searchProduct);
  }
  final CategoryRepository categoryRepository;
  final ProductRepository productRepository;

  void _onHomeScroll(HomeScroll event, Emitter<HomeState> emit) {
    emit(state.copyWith(isScrollingTop: event.isScrollingTop));
  }

  _getCategoryWithProducts(
      GetCategoryEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(categoryStatus: HomeStatus.loading));
    final result = await categoryRepository.getCategoryWithProducts();
    result.fold(
      (l) {
        emit(state.copyWith(
            error: l.toString(), categoryStatus: HomeStatus.error));
      },
      (r) {
        emit(
          state.copyWith(
            categoryWithProductsList: r,
            categoryStatus: HomeStatus.success,
            selectedList: [],
          ),
        );
      },
    );
  }

  _searchProduct(SearchEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(searchStatus: SearchStatus.searchLoading));
    if (event.search.length > 2) {
      emit(state.copyWith(searchStatus: SearchStatus.searchLoading));

      final result =
          await productRepository.getSearchProduct(search: event.search);
      result.fold(
        (l) {
          emit(state.copyWith(
              error: l.toString(), searchStatus: SearchStatus.searchError));
        },
        (r) {
          emit(
            state.copyWith(
              searchProduct: r,
              searchStatus: SearchStatus.searchSucces,
            ),
          );
        },
      );
    } else {
      emit(state.copyWith(searchStatus: SearchStatus.initial));
    }
  }

  _selectCategory(CategorySelectEvent event, Emitter<HomeState> emit) {
    if (event.selectedList.isEmpty) {
      state.copyWith(selectedList: []);
    } else {
      emit(state.copyWith(
        selectedList: event.selectedList,
      ));
    }
  }
}
