import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shop_app/core/repos/products_repos/base_products_repo.dart';
import 'package:shop_app/core/shared/models/products_response_models/product_model.dart';

part 'search_products_event.dart';
part 'search_products_state.dart';

class SearchProductsBloc
    extends Bloc<SearchProductsEvent, SearchProductsState> {
  final BaseProductsRepo baseProductsRepo;
  SearchProductsBloc(this.baseProductsRepo) : super(SearchProductsInitial()) {
    on<SearchProductEvent>(
      _searchProducts,
      transformer: (events, mapper) => events
          .debounceTime(const Duration(milliseconds: 500))
          .switchMap(mapper),
    );
  }
  void _searchProducts(
      SearchProductEvent event, Emitter<SearchProductsState> emit) async {
    emit(SearchProductsLoading());
    final result = await baseProductsRepo.searchProducts(query: event.query);
    result.fold(
        (failure) => emit(SearchProductsFailure(message: failure.message)),
        (products) => emit(SearchProductsSuccess(products: products)));
  }
}
