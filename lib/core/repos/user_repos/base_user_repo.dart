import 'package:dartz/dartz.dart';
import 'package:shop_app/core/errors/failures.dart';
import 'package:shop_app/features/login/models/login_request_body_model.dart';
import 'package:shop_app/features/login/models/login_response_model.dart';
import 'package:shop_app/features/profile/models/profile_response_model.dart';
import 'package:shop_app/features/signup/models/signup_request_body_model.dart';
import 'package:shop_app/features/signup/models/signup_response_model.dart';

abstract class BaseUserRepo {
  Future<Either<Failure, LoginResponseModel>> login(
      {required LoginRequestBodyModel loginRequestBody});
  Future<Either<Failure, SignupResponseModel>> signup(
      {required SignupRequestBodyModel signupRequestBody});
  Future<Either<Failure, ProfileResponseModel>> getProfile();
  Future<Either<Failure, ProfileResponseModel>> editProfile(
      {required String name, required String phone, required String email});
  Future<Either<Failure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}
