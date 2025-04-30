import 'package:flutter/material.dart';
import '../../../../core/themes/app_styles.dart';
import '../../models/contact_model.dart';
import 'custom_contact_image.dart';

class ContactListTileItem extends StatelessWidget {
  const ContactListTileItem({super.key, required this.contact});
  final ContactModel contact;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomContactImage(
        contact: contact,
      ),
      title: Text(
        contact.value ?? '',
        style: Styles.styleSemiBold20(context),
      ),
    );
  }
}
