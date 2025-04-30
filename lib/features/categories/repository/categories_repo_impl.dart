import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../core/errors/failures.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/network/api_service.dart';
import '../../../core/utils/constants.dart';
import '../models/categories_model/categories_response_model.dart';
import '../models/categories_model/category_model.dart';
import 'base_categories_repo.dart';

class CategoriesRepoImpl extends BaseCategoriesRepo{
  final ApiService apiService;

  CategoriesRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async{
    try {
      final response =
          await apiService.getData(endPoint: ApiConstants.categoriesEndPoint);
      final categoriesResponse = CategoriesResponseModel.fromJson(response.data);
      if (categoriesResponse.status == true) {
        return Right(categoriesResponse.categoriesData!.categoriesList!);
      }
      return Left(ServerFailure(categoriesResponse.message ?? AppConstants.unexpectedError));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('error in CategoriesRepoImpl.getCategories ${e.toString()}');
      return const Left(ServerFailure(AppConstants.unexpectedError));
    }
  }

}