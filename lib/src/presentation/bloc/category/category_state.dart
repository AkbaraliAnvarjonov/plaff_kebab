part of 'category_bloc.dart';

class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

class GetCategoryErrosState extends CategoryState {
  final String error;
  const GetCategoryErrosState({required this.error});

  @override
  List<Object?> get props => [error];
}

class GetCategorySuccesState extends CategoryState {
  final List<CategoryWithProducts> categoryWithProductsList;

  const GetCategorySuccesState({required this.categoryWithProductsList});

  @override
  List<Object?> get props => [categoryWithProductsList];
}

class GetCategoryLoading extends CategoryState {}
