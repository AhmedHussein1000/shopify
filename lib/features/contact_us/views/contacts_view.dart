import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/service_locator.dart';
import '../view_models/contacts_cubit/contacts_cubit.dart';
import 'widgets/contact_us_view_body_bloc_builder.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactsCubit(getIt())..getContacts(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Contact Us'),
        ),
        body: const ContactUsViewBodyBlocBuilder(),
      ),
    );
  }
}
