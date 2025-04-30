import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../models/cart_data_model.dart';
import '../models/cart_item_model.dart';

abstract class BaseCartRepo {
  Future<Either<Failure, CartDataModel>> getCarts();
  Future<Either<Failure, void>> addOrRemoveCart({required int productId});
  Future<Either<Failure, CartItemModel>> changeCartQuantity({required int cartId,required int quantity});
  Future<Either<Failure, void>> deleteCart({required int cartId});
}
