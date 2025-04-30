import 'package:flutter/material.dart';
import 'package:shop_app/core/widgets/custom_text_form_field.dart';
import 'package:shop_app/features/addresses/models/address_model.dart';
import 'package:shop_app/features/addresses/views/widgets/edit_address_button_bloc_consumer.dart';

class EditAddressView extends StatefulWidget {
  final AddressModel address;

  const EditAddressView({super.key, required this.address});

  @override
  State<EditAddressView> createState() => _EditAddressViewState();
}

class _EditAddressViewState extends State<EditAddressView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _cityController;
  late final TextEditingController _regionController;
  late final TextEditingController _detailsController;
  late final TextEditingController _notesController;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.address.name);
    _cityController = TextEditingController(text: widget.address.city);
    _regionController = TextEditingController(text: widget.address.region);
    _detailsController = TextEditingController(text: widget.address.details);
    _notesController = TextEditingController(text: widget.address.notes);
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _cityController.dispose();
    _regionController.dispose();
    _detailsController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Address'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 20,
                children: [
                  CustomTextFormField(
                    controller: _nameController,
                    hintText: _nameController.text,
                    labelText: 'Name',
                    prefixIconData: Icons.person_outline,
                  ),
                  CustomTextFormField(
                    controller: _cityController,
                    hintText: _cityController.text,
                    labelText: 'City',
                    prefixIconData: Icons.location_city_outlined,
                  ),
                  CustomTextFormField(
                    controller: _regionController,
                    hintText: _regionController.text,
                    labelText: 'Region',
                    prefixIconData: Icons.map_outlined,
                  ),
                  CustomTextFormField(
                    controller: _detailsController,
                    hintText: _detailsController.text,
                    labelText: 'Address Details',
                    prefixIconData: Icons.home_outlined,
                  ),
                  CustomTextFormField(
                    controller: _notesController,
                    hintText: _notesController.text,
                    labelText: 'Notes',
                    prefixIconData: Icons.note_outlined,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  EditAddressButtonBlocConsumer(
                      formKey: _formKey,
                      addressId: widget.address.id,
                      nameController: _nameController,
                      cityController: _cityController,
                      regionController: _regionController,
                      detailsController: _detailsController,
                      notesController: _notesController),
                ],
              ),
            ),
          ),
        ));
  }
}
