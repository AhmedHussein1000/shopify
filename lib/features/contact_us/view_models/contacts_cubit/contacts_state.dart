part of 'contacts_cubit.dart';

sealed class ContactsState extends Equatable {
  const ContactsState();

  @override
  List<Object> get props => [];
}

final class ContactsInitial extends ContactsState {}

final class ContactsLoading extends ContactsState {}

final class ContactsSuccess extends ContactsState {
  final List<ContactModel> contacts;
  const ContactsSuccess({required this.contacts});
}

final class ContactsFailure extends ContactsState {
  final String message;

  const ContactsFailure({required this.message});
}
