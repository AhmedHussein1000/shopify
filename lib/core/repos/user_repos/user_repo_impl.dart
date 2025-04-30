import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_app/core/cache/cache_keys.dart';
import 'package:shop_app/core/cache/shared_preferences_helper.dart';
import 'package:shop_app/core/errors/failures.dart';
import 'package:shop_app/core/network/api_constants.dart';
import 'package:shop_app/core/network/api_service.dart';
import 'base_user_repo.dart';
import 'package:shop_app/core/utils/constants.dart';
import 'package:shop_app/features/login/models/login_request_body_model.dart';
import 'package:shop_app/features/login/models/login_response_model.dart';
import 'package:shop_app/features/profile/models/profile_response_model.dart';
import 'package:shop_app/features/signup/models/signup_request_body_model.dart';
import 'package:shop_app/features/signup/models/signup_response_model.dart';

class UserRepoImpl extends BaseUserRepo {
  final ApiService apiService;

  UserRepoImpl(this.apiService);

  @override
  Future<Either<Failure, LoginResponseModel>> login(
      {required LoginRequestBodyModel loginRequestBody}) async {
    try {
      final response = await apiService.postData(
        endPoint: ApiConstants.loginEndPoint,
        data: loginRequestBody.toJson(),
      );
      LoginResponseModel loginResponse =
          LoginResponseModel.fromJson(response.data);
      if (loginResponse.status == true) {
        await _cacheUserToken(loginResponse);
        return Right(loginResponse);
      }
      return Left(ServerFailure(loginResponse.message ==
              'This credentials does not meet any of our records, please make sure you have entered the right credentials'
          ? 'The email or password is incorrect'
          : loginResponse.message ?? AppConstants.loginError));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('error in LoginRepoImpl.login ${e.toString()}');
      return const Left(ServerFailure(AppConstants.loginError));
    }
  }

  @override
  Future<Either<Failure, SignupResponseModel>> signup(
      {required SignupRequestBodyModel signupRequestBody}) async {
    try {
      final response = await apiService.postData(
        endPoint: ApiConstants.signupEndPoint,
        data: signupRequestBody.toJson(),
      );
      SignupResponseModel signupResponse =
          SignupResponseModel.fromJson(response.data);
      if (signupResponse.status == true) {
        return Right(signupResponse);
      }
      return Left(
          ServerFailure(signupResponse.message ?? AppConstants.signupError));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('error in SignupRepoImpl.signup ${e.toString()}');
      return const Left(ServerFailure(AppConstants.signupError));
    }
  }

  @override
  Future<Either<Failure, void>> changePassword(
      {required String currentPassword, required String newPassword}) async {
    try {
      final response = await apiService.postData(
          endPoint: ApiConstants.changePasswordEndPoint,
          data: {
            'current_password': currentPassword,
            'new_password': newPassword
          },
          );
      if (response.data['status'] == true) {
        return const Right(null);
      }

      return Left(ServerFailure(response.data['message'] ==
              'This credentials does not meet any of our records, please make sure you have entered the right credentials'
          ? 'The password you entered is incorrect'
          : response.data['message']));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('error in ChangePasswordRepoImpl.changePassword ${e.toString()}');
      return const Left(ServerFailure(AppConstants.changePasswordError));
    }
  }

  @override
  Future<Either<Failure, ProfileResponseModel>> editProfile(
      {required String name,
      required String phone,
      required String email}) async {
    try {
      final response = await apiService.putData(
          endPoint: ApiConstants.updateProfileEndPoint,
          data: {'name': name, 'phone': phone, 'email': email},
         );
      ProfileResponseModel profileResponse =
          ProfileResponseModel.fromJson(response.data);
      if (profileResponse.status == true) {
        return Right(profileResponse);
      }
      return Left(ServerFailure(profileResponse.message ?? ''));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('ProfileRepoImpl.editProfile ${e.toString()}');
      return const Left(ServerFailure(AppConstants.editProfileError));
    }
  }

  @override
  Future<Either<Failure, ProfileResponseModel>> getProfile() async {
    try {
      final response = await apiService.getData(
          endPoint: ApiConstants.profileEndPoint,
        );
      ProfileResponseModel profileResponse =
          ProfileResponseModel.fromJson(response.data);
      if (profileResponse.status == true) {
        return Right(profileResponse);
      }
      return Left(ServerFailure(profileResponse.message ?? ''));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('ProfileRepoImpl.getProfile ${e.toString()}');
      return const Left(ServerFailure(AppConstants.getProfileError));
    }
  }

  Future<void> _cacheUserToken(LoginResponseModel loginResponse) async {
    await SharedPrefencesHelper.saveData<String>(
        key: CacheKeys.token, value: loginResponse.userData!.token ?? '');
    SharedPrefencesHelper.token =
        SharedPrefencesHelper.getData<String>(key: CacheKeys.token);
  }
}
