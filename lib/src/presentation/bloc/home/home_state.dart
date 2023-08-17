part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.searchStatus = SearchStatus.initial,
    this.searchProduct = const [],
    this.isScrollingTop = false,
    this.categoryWithProductsList = const [],
    this.selectedList = const [],
    this.categoryStatus = HomeStatus.initial,
    this.error = "",
  });
  final SearchStatus searchStatus;
  final List<SearchProduct> searchProduct;
  final HomeStatus categoryStatus;
  final bool isScrollingTop;
  final List<CategoryWithProducts> categoryWithProductsList;
  final List<String> selectedList;
  final String error;

  HomeState copyWith({
    SearchStatus? searchStatus,
    List<SearchProduct>? searchProduct,
    String? error,
    bool? isScrollingTop,
    HomeStatus? categoryStatus,
    List<CategoryWithProducts>? categoryWithProductsList,
    List<String>? selectedList,
  }) =>
      HomeState(
          error: error ?? this.error,
          searchStatus: searchStatus ?? this.searchStatus,
          searchProduct: searchProduct ?? this.searchProduct,
          isScrollingTop: isScrollingTop ?? this.isScrollingTop,
          categoryStatus: categoryStatus ?? this.categoryStatus,
          categoryWithProductsList:
              categoryWithProductsList ?? this.categoryWithProductsList,
          selectedList: selectedList ?? this.selectedList);

  @override
  List<Object?> get props => [
        isScrollingTop,
        categoryWithProductsList,
        selectedList,
        categoryStatus,
        error,
        searchProduct,
        searchStatus,
      ];
}

enum HomeStatus {
  initial,
  loading,
  success,
  error,
}

enum SearchStatus {
  initial,
  searchLoading,
  searchSucces,
  searchError,
}

extension HomeStatusX on HomeStatus {
  bool get isInitial => this == HomeStatus.initial;

  bool get isLoading => this == HomeStatus.loading;

  bool get isSuccess => this == HomeStatus.success;

  bool get isError => this == HomeStatus.error;
}

extension SearchStatusX on SearchStatus {
  bool get isInitial => this == SearchStatus.initial;

  bool get isLoading => this == SearchStatus.searchLoading;

  bool get isSuccess => this == SearchStatus.searchSucces;

  bool get isError => this == SearchStatus.searchError;
}
