import 'package:flutter/material.dart';
import '../../../../core/functions/launch_url.dart';
import '../../models/contact_model.dart';
import 'custom_contact_image.dart';

class ContactImageItem extends StatelessWidget {
  const ContactImageItem({super.key, required this.contact});
  final ContactModel contact;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrlFunction(contact.value),
      child: CustomContactImage(
        contact: contact,
      ),
    );
  }
}
