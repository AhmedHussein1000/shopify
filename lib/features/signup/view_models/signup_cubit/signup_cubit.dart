import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/repos/user_repos/base_user_repo.dart';
import '../../models/signup_request_body_model.dart';
import '../../models/signup_response_model.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(
    this.baseUserRepo,
  ) : super(SignupInitial());
  final BaseUserRepo baseUserRepo;

  Future<void> signup(
      {required SignupRequestBodyModel signupRequestBody}) async {
    emit(SignupLoading());
    var result =
        await baseUserRepo.signup(signupRequestBody: signupRequestBody);
    result.fold(
      (failure) => emit(SignupFailure(message: failure.message)),
      (signupResponse) => emit(SignupSuccess(signupResponse: signupResponse)),
    );
  }
}
