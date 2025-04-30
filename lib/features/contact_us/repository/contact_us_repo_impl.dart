import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../core/errors/failures.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/network/api_service.dart';
import '../../../core/utils/constants.dart';
import '../models/contacts_response_model.dart';
import 'base_contact_us_repo.dart';

class ContactUsRepoImpl extends BaseContactUsRepo {
  final ApiService apiService;

  ContactUsRepoImpl(this.apiService);
  @override
  Future<Either<Failure, ContactsResponseModel>> getContacts() async {
    try {
      final response =
          await apiService.getData(endPoint: ApiConstants.contactsEndPoint);
      final contactsResponse = ContactsResponseModel.fromJson(response.data);
      if (contactsResponse.status == true) {
        return Right(contactsResponse);
      }
      return Left(ServerFailure(
          contactsResponse.message ?? AppConstants.unexpectedError));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('error in ContactUsRepoImpl.getContacts ${e.toString()}');
      return const Left(ServerFailure(AppConstants.unexpectedError));
    }
  }
}
