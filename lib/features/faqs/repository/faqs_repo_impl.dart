import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../core/errors/failures.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/network/api_service.dart';
import '../../../core/utils/constants.dart';
import '../models/faqs_model.dart';
import 'base_faqs_repo.dart';

class FAQsRepoImpl extends BaseFAQsRepo {
  final ApiService apiService;

  FAQsRepoImpl(this.apiService);
  @override
  Future<Either<Failure, FAQsModel>> getFAQs() async {
    try {
      final response =
          await apiService.getData(endPoint: ApiConstants.faqsEndPoint);
      final faqsModel = FAQsModel.fromJson(response.data);
      if (faqsModel.status == true) {
        return Right(faqsModel);
      }
      return Left(
          ServerFailure(faqsModel.message ?? AppConstants.unexpectedError));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('error in FaqsRepoImpl.getFAQs ${e.toString()}');
      return const Left(ServerFailure(AppConstants.unexpectedError));
    }
  }
}
