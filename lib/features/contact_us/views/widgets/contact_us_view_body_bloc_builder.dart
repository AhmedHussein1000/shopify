import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../../core/widgets/custom_text_message.dart';
import '../../view_models/contacts_cubit/contacts_cubit.dart';
import 'contact_us_view_body.dart';

class ContactUsViewBodyBlocBuilder extends StatelessWidget {
  const ContactUsViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsCubit, ContactsState>(
      builder: (context, state) {
        if (state is ContactsFailure) {
          return CustomTextMessage(text: state.message);
        } else if (state is ContactsSuccess) {
          return ContactUsViewBody(allContacts:state.contacts,);
        } else {
          return const CustomCircularProgressIndicator();
        }
      },
    );
  }
}
