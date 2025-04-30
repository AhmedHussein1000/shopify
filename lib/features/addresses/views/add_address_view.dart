import 'package:flutter/material.dart';
import 'package:shop_app/features/addresses/views/widgets/add_address_button_bloc_consumer.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class AddAddressView extends StatefulWidget {
  const AddAddressView({super.key});

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController nameController;
  late final TextEditingController cityController;
  late final TextEditingController regionController;
  late final TextEditingController detailsController;
  late final TextEditingController notesController;

  @override
  void initState() {
    nameController = TextEditingController();
    cityController = TextEditingController();
    regionController = TextEditingController();
    detailsController = TextEditingController();
    notesController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    cityController.dispose();
    regionController.dispose();
    detailsController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Address'),
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
                  hintText: 'Enter name',
                  controller: nameController,
                  labelText: 'Name',
                  prefixIconData: Icons.person_outline,
                ),
                CustomTextFormField(
                  hintText: 'Enter city',
                  controller: cityController,
                  labelText: 'City',
                  prefixIconData: Icons.location_city_outlined,
                ),
                CustomTextFormField(
                  hintText: 'Enter region',
                  controller: regionController,
                  labelText: 'Region',
                  prefixIconData: Icons.map_outlined,
                ),
                CustomTextFormField(
                  hintText: 'Enter details',
                  controller: detailsController,
                  labelText: 'Details',
                  prefixIconData: Icons.home_outlined,
                ),
                CustomTextFormField(
                  hintText: 'Enter notes',
                  controller: notesController,
                  labelText: 'Notes',
                  prefixIconData: Icons.note_outlined,
                ),
                const SizedBox(height: 10),
                AddAddressButtonBlocConsumer(
                    formKey: _formKey,
                    nameController: nameController,
                    cityController: cityController,
                    regionController: regionController,
                    detailsController: detailsController,
                    notesController: notesController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
