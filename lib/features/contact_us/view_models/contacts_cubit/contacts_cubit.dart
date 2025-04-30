import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/contact_model.dart';
import '../../repository/base_contact_us_repo.dart';
part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit(this.baseContactUsRepo) : super(ContactsInitial());
  final BaseContactUsRepo baseContactUsRepo;
  void getContacts() async {
    emit(ContactsLoading());
    var result = await baseContactUsRepo.getContacts();
    result.fold(
        (failure) => emit(ContactsFailure(message: failure.message)),
        (contactsResponse) => emit(ContactsSuccess(
            contacts: contactsResponse.contactsData!.contactsList!)));
  }
}
