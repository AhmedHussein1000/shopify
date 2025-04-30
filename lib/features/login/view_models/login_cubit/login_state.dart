part of 'login_cubit.dart';

sealed class LoginState {
  const LoginState();
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final LoginResponseModel loginResponse;

  const LoginSuccess({required this.loginResponse});
}

final class LoginFailure extends LoginState {
  final String message;

  const LoginFailure({required this.message});
}
