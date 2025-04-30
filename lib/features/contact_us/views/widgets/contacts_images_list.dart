import 'package:flutter/material.dart';
import '../../models/contact_model.dart';
import 'contact_image_item.dart';


class ContactsImagesList extends StatelessWidget {
  const ContactsImagesList({super.key, required this.allContacts});
  final List<ContactModel> allContacts;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 20,
      runSpacing: 20,
      children: _getImagesContacts(allContacts).map((contact) {
        return ContactImageItem(contact: contact);
      }).toList(),
    );
  }
}

List<ContactModel> _getImagesContacts(List<ContactModel> contacts) {
  return contacts.where((contact) => contact.type == 3).toList();
}
