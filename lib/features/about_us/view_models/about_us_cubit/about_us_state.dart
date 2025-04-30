part of 'about_us_cubit.dart';

sealed class AboutUsState extends Equatable {
  const AboutUsState();

  @override
  List<Object> get props => [];
}

final class AboutUsInitial extends AboutUsState {}

final class AboutUsLoading extends AboutUsState {}

final class AboutUsSuccess extends AboutUsState {
  final AboutUsDataModel aboutUsData;

  const AboutUsSuccess(this.aboutUsData);
}

final class AboutUsFailure extends AboutUsState {
  final String message;

  const AboutUsFailure(this.message);
}
