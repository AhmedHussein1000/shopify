import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/repos/user_repos/base_user_repo.dart';
import '../../models/login_request_body_model.dart';
import '../../models/login_response_model.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.baseUserRepo) : super(LoginInitial());
  final BaseUserRepo baseUserRepo;
  Future<void> login({required LoginRequestBodyModel loginRequestBody}) async {
    var result = await baseUserRepo.login(loginRequestBody: loginRequestBody);
    result.fold((failure) => emit(LoginFailure(message: failure.message)),
        (loginResponse) => emit(LoginSuccess(loginResponse: loginResponse)));
  }
}
