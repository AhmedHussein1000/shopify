import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_app/core/errors/failures.dart';
import 'package:shop_app/core/network/api_constants.dart';
import 'package:shop_app/core/network/api_service.dart';
import 'base_products_repo.dart';
import 'package:shop_app/core/shared/models/products_response_models/product_model.dart';
import 'package:shop_app/core/shared/models/products_response_models/products_response_model.dart';
import 'package:shop_app/core/utils/constants.dart';
import 'package:shop_app/features/favorites/models/favorites_model/favorite_item_model.dart';
import 'package:shop_app/features/favorites/models/favorites_model/favorites_response_model.dart';
import 'package:shop_app/features/product_details/models/product_details_response_model.dart';

class ProductsRepoImpl extends BaseProductsRepo {
  final ApiService apiService;

  ProductsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<FavoriteItemModel>>> getFavorites() async {
    try {
      final response = await apiService.getData(
          endPoint: ApiConstants.favoritesEndPoint,
          );
      final favoritesResponse = FavoritesResponseModel.fromJson(response.data);
      if (favoritesResponse.status == true) {
        return Right(favoritesResponse.data!.favoritesData ?? []);
      }
      return Left(ServerFailure(
          favoritesResponse.message ?? AppConstants.unexpectedError));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('getFavorites error: ${e.toString()}');
      return const Left(ServerFailure(AppConstants.unexpectedError));
    }
  }

  @override
  Future<Either<Failure, void>> addOrRemoveFavorite(
      {required int productId}) async {
    try {
      final response = await apiService.postData(
          endPoint: ApiConstants.favoritesEndPoint,
          data: {
            ApiConstants.productIDKey: productId,
          },
         );

      if (response.data['status'] == true) {
        return const Right(null);
      }
      return Left(ServerFailure(
          response.data['message'] ?? AppConstants.unexpectedError));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('addOrRemoveFavorite error: ${e.toString()}');
      return const Left(ServerFailure(AppConstants.unexpectedError));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProductDetails(
      {required int productId}) async {
    try {
      final response = await apiService.getData(
          endPoint: ApiConstants.productDetailsEndPoint(productId: productId),
         );
      final productDetailsResponse =
          ProductDetailsResponseModel.fromJson(response.data);
      if (productDetailsResponse.status == true) {
        return Right(productDetailsResponse.product);
      }
      return Left(ServerFailure(
          productDetailsResponse.message ?? AppConstants.unexpectedError));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return const Left(ServerFailure(AppConstants.unexpectedError));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProductsByCategory(
      {required int categoryId}) async {
    try {
      final response = await apiService.getData(
          endPoint:
              ApiConstants.productsByCategoryEndPoint(categoryId: categoryId),
         );
      final productsResponse = ProductsResponseModel.fromJson(response.data);
      if (productsResponse.status == true) {
        return Right(productsResponse.productsData?.products ?? []);
      }
      return Left(ServerFailure(
          productsResponse.message ?? AppConstants.unexpectedError));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('error in CategoryProductsRepoImpl.getProductsByCategory ${e.toString()}');
      return const Left(ServerFailure(AppConstants.unexpectedError));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> searchProducts(
      {required String query}) async {
    try {
      if (query.isEmpty) return const Right([]);
      final response = await apiService.postData(
          endPoint: ApiConstants.searchEndPoint,
          data: {'text': query},
         );
      final productsResponse = ProductsResponseModel.fromJson(response.data);
      if (productsResponse.status == true) {
        return Right(productsResponse.productsData?.products ?? []);
      }
      return Left(ServerFailure(
          productsResponse.message ?? AppConstants.unexpectedError));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('error in SearchProductsRepoImpl.searchProducts ${e.toString()}');
      return const Left(ServerFailure(AppConstants.unexpectedError));
    }
  }
}
