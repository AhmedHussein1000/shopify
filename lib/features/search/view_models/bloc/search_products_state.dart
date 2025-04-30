part of 'search_products_bloc.dart';

sealed class SearchProductsState extends Equatable {
  const SearchProductsState();
  
  @override
  List<Object> get props => [];
}

final class SearchProductsInitial extends SearchProductsState {}

final class SearchProductsLoading extends SearchProductsState {}

final class SearchProductsSuccess extends SearchProductsState {
  final List<ProductModel> products;
  const SearchProductsSuccess({required this.products});
}

final class SearchProductsFailure extends SearchProductsState {
  final String message;
  const SearchProductsFailure({required this.message});
}
