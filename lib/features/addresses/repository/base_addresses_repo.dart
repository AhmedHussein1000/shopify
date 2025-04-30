import 'package:dartz/dartz.dart';
import 'package:shop_app/core/errors/failures.dart';
import 'package:shop_app/features/addresses/models/address_model.dart';
import 'package:shop_app/features/addresses/models/address_request_body_model.dart';

abstract class BaseAddressesRepo {
  Future<Either<Failure, void>> addAddress(
      {required AddressRequestBodyModel addressRequestBody});
  Future<Either<Failure,List<AddressModel>>> getAddresses();
  Future<Either<Failure,void>> updateAddress(
      {required AddressModel address});
  Future<Either<Failure,void>> deleteAddress({required int addressId});    
}
