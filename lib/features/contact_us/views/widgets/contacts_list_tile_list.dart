import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_divider.dart';
import '../../models/contact_model.dart';
import 'contact_list_tile_item.dart';

class ContactsListTileList extends StatelessWidget {
  const ContactsListTileList({super.key, required this.allContacts});
  final List<ContactModel> allContacts;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 20),
      itemCount: _getListTileContacts(allContacts).length,
      separatorBuilder: (context, index) => const CustomDivider(),
      itemBuilder: (context, index) {
        return ContactListTileItem(
            contact: _getListTileContacts(allContacts)[index]);
      },
    );
  }

  List<ContactModel> _getListTileContacts(List<ContactModel> contacts) {
    return contacts.where((contact) => contact.type != 3).toList();
  }
}
