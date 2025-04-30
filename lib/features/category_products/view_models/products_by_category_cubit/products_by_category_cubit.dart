import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/repos/products_repos/base_products_repo.dart';
import '../../../../core/shared/models/products_response_models/product_model.dart';

part 'products_by_category_state.dart';

class ProductsByCategoryCubit extends Cubit<ProductsByCategoryState> {
  final BaseProductsRepo baseProductsRepo;
  ProductsByCategoryCubit(this.baseProductsRepo)
      : super(ProductsByCategoryInitial());
  Future<void> getProductsByCategory({required int categoryId}) async {
    emit(ProductsByCategoryLoading());
    final result = await baseProductsRepo.getProductsByCategory(
        categoryId: categoryId);
    result.fold(
        (failure) => emit(ProductsByCategoryFailure(message: failure.message)),
        (products) => emit(ProductsByCategorySuccess(products: products)));
  }
}
