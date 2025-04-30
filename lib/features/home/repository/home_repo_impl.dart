import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../core/cache/shared_preferences_helper.dart';
import '../../../core/errors/failures.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/network/api_service.dart';
import '../../../core/utils/constants.dart';
import '../models/home_model/home_data_model.dart';
import '../models/home_model/home_response_model.dart';
import 'base_home_repo.dart';

class HomeRepoImpl extends BaseHomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, HomeDataModel>> getHomeData() async {
    try {
      final response = await apiService.getData(
          endPoint: ApiConstants.homeEndPoint,
         );
      final homeResponse = HomeResponseModel.fromJson(response.data);
      if (homeResponse.status == true) {
        return Right(homeResponse.homeData!);
      }
      return Left(
          ServerFailure(homeResponse.message ?? AppConstants.unexpectedError));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('error in HomeRepoImpl.getHomeData ${e.toString()}');
      return const Left(ServerFailure(AppConstants.unexpectedError));
    }
  }
}
