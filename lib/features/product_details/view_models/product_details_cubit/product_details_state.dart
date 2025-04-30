part of 'product_details_cubit.dart';

sealed class ProductDetailsState {
  const ProductDetailsState();

}

final class ProductDetailsInitial extends ProductDetailsState {}
final class ProductDetailsLoading extends ProductDetailsState {}
final class ProductDetailsSuccess extends ProductDetailsState {
  final ProductModel product;
  const ProductDetailsSuccess({required this.product});
}
final class ProductDetailsFailure extends ProductDetailsState {
  final String message;
  const ProductDetailsFailure({required this.message});
}