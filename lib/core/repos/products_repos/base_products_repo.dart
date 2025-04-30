import 'package:dartz/dartz.dart';
import 'package:shop_app/core/errors/failures.dart';
import 'package:shop_app/core/shared/models/products_response_models/product_model.dart';
import 'package:shop_app/features/favorites/models/favorites_model/favorite_item_model.dart';

abstract class BaseProductsRepo {
  Future<Either<Failure, List<ProductModel>>> getProductsByCategory(
      {required int categoryId});
  Future<Either<Failure, List<FavoriteItemModel>>> getFavorites();
  Future<Either<Failure, void>> addOrRemoveFavorite({required int productId});
   Future<Either<Failure, ProductModel>> getProductDetails(
      {required int productId});
     Future<Either<Failure, List<ProductModel>>> searchProducts({required String query});
       
}