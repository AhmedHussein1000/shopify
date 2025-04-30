import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/repos/user_repos/base_user_repo.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final BaseUserRepo baseUserRepo;
  ChangePasswordCubit(this.baseUserRepo)
      : super(ChangePasswordInitial());

  void changePassword(
      {required String currentPassword, required String newPassword}) async {
    emit(ChangePasswordLoading());
    var result = await baseUserRepo.changePassword(
        currentPassword: currentPassword, newPassword: newPassword);
    result.fold(
        (failure) => emit(ChangePasswordFailure(message: failure.message)),
        (r) => emit(ChangePasswordSuccess()));
  }
}
