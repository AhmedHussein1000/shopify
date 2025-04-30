part of 'profile_cubit.dart';

abstract class ProfileState {
  const ProfileState();
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final ProfileResponseModel profileResponseModel;

  const ProfileSuccess({required this.profileResponseModel});
}

class ProfileFailure extends ProfileState {
  final String message;

  const ProfileFailure({required this.message});
}
// edit profile
class EditProfileLoading extends ProfileState {}
class EditProfileSuccess extends ProfileState {}
class EditProfileFailure extends ProfileState {
  final String message;

  const EditProfileFailure({required this.message});
}
