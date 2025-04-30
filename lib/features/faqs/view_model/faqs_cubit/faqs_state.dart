part of 'faqs_cubit.dart';

sealed class FAQsState extends Equatable {
  const FAQsState();

  @override
  List<Object> get props => [];
}

final class FAQsInitial extends FAQsState {}

final class FAQsLoading extends FAQsState {}

final class FAQsSuccess extends FAQsState {
  final FAQsModel faqsModel;

  const FAQsSuccess({required this.faqsModel});
}

final class FAQsFailure extends FAQsState {
  final String message;

  const FAQsFailure({required this.message});
}
