part of 'products_by_category_cubit.dart';

sealed class ProductsByCategoryState {
  const ProductsByCategoryState();
}

final class ProductsByCategoryInitial extends ProductsByCategoryState {}
final class ProductsByCategoryLoading extends ProductsByCategoryState {}
final class ProductsByCategorySuccess extends ProductsByCategoryState {
  final List<ProductModel> products;
  const ProductsByCategorySuccess({required this.products});
}
final class ProductsByCategoryFailure extends ProductsByCategoryState {
  final String message;
  const ProductsByCategoryFailure({required this.message});
}