import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_app/core/errors/failures.dart';
import 'package:shop_app/core/network/api_constants.dart';
import 'package:shop_app/core/network/api_service.dart';
import 'package:shop_app/core/utils/constants.dart';
import 'package:shop_app/features/addresses/models/address_model.dart';
import 'package:shop_app/features/addresses/models/address_request_body_model.dart';
import 'package:shop_app/features/addresses/models/addresses_response_model.dart';
import 'package:shop_app/features/addresses/repository/base_addresses_repo.dart';

class AddressesRepoImpl extends BaseAddressesRepo {
  final ApiService apiService;

  AddressesRepoImpl(this.apiService);
  @override
  Future<Either<Failure, void>> addAddress(
      {required AddressRequestBodyModel addressRequestBody}) async {
    try {
      final response = await apiService.postData(
          endPoint: ApiConstants.addressesEndPoint,
          data: addressRequestBody.toJson());
      final AddressesResponseModel addressesResponse =
          AddressesResponseModel.fromJson(response.data);
      if (addressesResponse.status == true) {
        return right(null);
      }
      return left(ServerFailure(
          addressesResponse.message ?? AppConstants.addAddressError));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('error in AddressesRepoImpl.addAddress ${e.toString()}');
      return const Left(ServerFailure(AppConstants.addAddressError));
    }
  }

  @override
  Future<Either<Failure, List<AddressModel>>> getAddresses() async {
    try {
      final response =
          await apiService.getData(endPoint: ApiConstants.addressesEndPoint);
      final AddressesResponseModel addressesResponse =
          AddressesResponseModel.fromJson(response.data);
      if (addressesResponse.status == true) {
        return right(addressesResponse.addressesData!.addresses ?? []);
      }
      return left(ServerFailure(
          addressesResponse.message ?? AppConstants.getAddressesError));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('error in AddressesRepoImpl.getAddresses ${e.toString()}');
      return const Left(ServerFailure(AppConstants.getAddressesError));
    }
  }

  @override
  Future<Either<Failure, void>> updateAddress(
      {required AddressModel address}) async {
    try {
      final response = await apiService.putData(
          endPoint: ApiConstants.updateAddressEndPoint(addressId:address.id),
          data: address.toJson());
      final AddressesResponseModel addressesResponse =
          AddressesResponseModel.fromJson(response.data);
      if (addressesResponse.status == true) {
        return right(null);
      }
      return left(ServerFailure(
          addressesResponse.message ?? AppConstants.updateAddressError));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('error in AddressesRepoImpl.updateAddress ${e.toString()}');
      return const Left(ServerFailure(AppConstants.updateAddressError));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAddress({required int addressId}) async{
    try {
      final response = await apiService.deleteData(
          endPoint: ApiConstants.deleteAddressEndPoint(addressId: addressId));
      final AddressesResponseModel addressesResponse =
          AddressesResponseModel.fromJson(response.data);
      if (addressesResponse.status == true) {
        return right(null);
      }
      return left(ServerFailure(
          addressesResponse.message?? AppConstants.deleteAddressError));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('error in AddressesRepoImpl.deleteAddress ${e.toString()}');
      return const Left(ServerFailure(AppConstants.deleteAddressError));
    }
  }
}
