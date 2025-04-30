part of 'home_cubit.dart';

sealed class HomeState{
  const HomeState();


}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final HomeDataModel homeData;

  const HomeSuccess({required this.homeData});
}

final class HomeFailure extends HomeState {
  final String message;
  const HomeFailure({required this.message});
}
