part of 'search_products_bloc.dart';

sealed class SearchProductsEvent extends Equatable {
  
  const SearchProductsEvent();

  @override
  List<Object> get props => [];
}
final class SearchProductEvent extends SearchProductsEvent {
  final String query;
  const SearchProductEvent(this.query);
  @override
  List<Object> get props => [query];
}
