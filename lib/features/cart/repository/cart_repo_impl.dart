import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../core/errors/failures.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/network/api_service.dart';
import '../../../core/utils/constants.dart';
import '../models/cart_data_model.dart';
import '../models/cart_item_model.dart';
import '../models/cart_response_model.dart';
import 'base_cart_repo.dart';

class CartRepoImpl extends BaseCartRepo {
  final ApiService apiService;

  CartRepoImpl(this.apiService);
  @override
  Future<Either<Failure, void>> addOrRemoveCart(
      {required int productId}) async {
    try {
      final response = await apiService.postData(
          endPoint: ApiConstants.cartsEndPoint,
          data: {ApiConstants.productIDKey: productId},
        );

      if (response.data['status'] == true) {
        return right(null);
      }
      return left(ServerFailure(response.data['message']));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('error in add or remove cart repo ${e.toString()}');
      return left(const ServerFailure(AppConstants.addOrRemoveCartError));
    }
  }

  @override
  Future<Either<Failure, CartDataModel>> getCarts() async {
    try {
      final response = await apiService.getData(
          endPoint: ApiConstants.cartsEndPoint,
      );
      final cartsResponse = CartResponseModel.fromJson(response.data);
      if (cartsResponse.status == true) {
        return right(cartsResponse.cartData!);
      }
      return left(ServerFailure(cartsResponse.message!));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('error in get carts repo ${e.toString()}');
      return left(const ServerFailure(AppConstants.getCartsError));
    }
  }

  @override
  Future<Either<Failure, CartItemModel>> changeCartQuantity(
      {required int cartId, required int quantity}) async {
    try {
      final response = await apiService.putData(
          endPoint: ApiConstants.updateCartEndPoint(cartId: cartId),
          data: {
            ApiConstants.quantityKey: quantity,
          },
          );
      if (response.data['status'] == true) {
        final cartItem = CartItemModel.fromJson(response.data['data']['cart']);
        return right(cartItem);
      }
      return left(ServerFailure(response.data['message']));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('error in change cart quantity repo ${e.toString()}');
      return left(const ServerFailure(AppConstants.changeCartQuantityError));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCart({required int cartId}) async {
    try {
      final response = await apiService.deleteData(
          endPoint: ApiConstants.deleteCartEndPoint(cartId: cartId),
       );
      if (response.data['status'] == true) {
        return right(null);
      }
      return left(ServerFailure(response.data['message']));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('error in delete cart repo ${e.toString()}');
      return left(const ServerFailure(AppConstants.deleteCartItemError));
    }
  }
}
