import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/repos/user_repos/base_user_repo.dart';
import '../../models/profile_response_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final BaseUserRepo baseUserRepo;

  ProfileCubit(this.baseUserRepo) : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(ProfileLoading());
    var result = await baseUserRepo.getProfile();
    result.fold(
        (failure) => emit(ProfileFailure(message: failure.message)),
        (profileResponse) =>
            emit(ProfileSuccess(profileResponseModel: profileResponse)));
  }

  Future<void> editProfile({
    required String name,
    required String phone,
    required String email,
  }) async {
    emit(EditProfileLoading());
    final result =
        await baseUserRepo.editProfile(name: name, phone: phone, email: email);

    result.fold((failure) => emit(EditProfileFailure(message: failure.message)),
        (profileResponse) {
      getProfile();
      emit(EditProfileSuccess());
    });
  }
}
