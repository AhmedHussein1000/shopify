import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/repos/products_repos/base_products_repo.dart';
import '../../../../core/shared/models/products_response_models/product_model.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final BaseProductsRepo baseProductsRepo;
  ProductDetailsCubit(this.baseProductsRepo)
      : super(ProductDetailsInitial());
  Future<void> getProductDetails({required int productId}) async {
    emit(ProductDetailsLoading());
    final result =
        await baseProductsRepo.getProductDetails(productId: productId);
    result.fold(
        (failure) => emit(ProductDetailsFailure(message: failure.message)),
        (product) => emit(ProductDetailsSuccess(product: product)));
  }
}
