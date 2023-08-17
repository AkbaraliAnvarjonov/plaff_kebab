part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeScroll extends HomeEvent {
  const HomeScroll({
    required this.isScrollingTop,
  });

  final bool isScrollingTop;

  @override
  List<Object?> get props => [isScrollingTop];
}

class GetCategoryEvent extends HomeEvent {
  const GetCategoryEvent();

  @override
  List<Object?> get props => [];
}

class CategorySelectEvent extends HomeEvent {
  final List<String> selectedList;
  final List<CategoryWithProducts> categoryWithProductsList;
  const CategorySelectEvent(
      {required this.selectedList, required this.categoryWithProductsList});
  @override
  List<Object?> get props => [selectedList, categoryWithProductsList];
}

class SearchEvent extends HomeEvent {
  const SearchEvent({required this.search});

  final String search;

  @override
  List<Object?> get props => [search];
}
