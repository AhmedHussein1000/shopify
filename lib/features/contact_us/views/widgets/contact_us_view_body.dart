import 'package:flutter/material.dart';
import '../../models/contact_model.dart';
import 'contacts_images_list.dart';
import 'contacts_list_tile_list.dart';

class ContactUsViewBody extends StatelessWidget {
  const ContactUsViewBody({
    super.key, required this.allContacts,
  });
  final List<ContactModel> allContacts;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ContactsListTileList(
            allContacts: allContacts,
          ),
        ),
        ContactsImagesList(
          allContacts: allContacts,
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
