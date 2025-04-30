part of 'categories_cubit.dart';

sealed class CategoriesState {
  const CategoriesState();
}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesSuccess extends CategoriesState {
  final List<CategoryModel> categories;

  const CategoriesSuccess({required this.categories});
}

final class CategoriesFailure extends CategoriesState {
  final String message;

  const CategoriesFailure({required this.message});
}
