import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../core/errors/failures.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/network/api_service.dart';
import '../../../core/utils/constants.dart';
import '../models/about_us_model.dart';
import 'base_about_us_repo.dart';

class AboutUsRepoImpl extends BaseAboutUsRepo {
  final ApiService apiService;

  AboutUsRepoImpl( this.apiService);
  @override
  Future<Either<Failure, AboutUsModel>> getAboutUsAndTerms() async{
    try {
      final response =
          await apiService.getData(endPoint: ApiConstants.settingsEndPoint);
      final aboutUsModel = AboutUsModel.fromJson(response.data);
      if (aboutUsModel.status == true) {
        return Right(aboutUsModel);
      }
      return Left(ServerFailure(aboutUsModel.message ?? AppConstants.unexpectedError));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return const Left(ServerFailure(AppConstants.unexpectedError));
    }
  }
}
