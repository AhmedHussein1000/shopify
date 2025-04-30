import 'package:flutter/material.dart';
import 'edit_profile_button_bloc_consumer.dart';
import '../../../../core/widgets/custom_profile_image.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({
    super.key,
    required this.username,
    required this.phone,
    required this.email,
  });

  final String username;
  final String phone;
  final String email;
  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  late final TextEditingController usernameController;
  late final TextEditingController phoneController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    usernameController = TextEditingController(text: widget.username);
    phoneController = TextEditingController(text: widget.phone);
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              EditProfileForm(
                  usernameController: usernameController,
                  phoneController: phoneController),
              const SizedBox(height: 50),
              EditProfileButtonBlocConsumer(
                formKey: _formKey,
                nameController: usernameController,
                phoneController: phoneController,
                email: widget.email,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({
    super.key,
    required this.usernameController,
    required this.phoneController,
  });

  final TextEditingController usernameController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomProfileImage(
          parentCircleRadius: 37,
          childCircleRadius: 35,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          hintText: usernameController.text,
          keyboardType: TextInputType.text,
          prefixIconData: Icons.person_2_outlined,
          controller: usernameController,
          labelText: 'username',
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          hintText: phoneController.text,
          keyboardType: TextInputType.phone,
          prefixIconData: Icons.phone_android_outlined,
          controller: phoneController,
          labelText: 'Phone Number',
        ),
      ],
    );
  }
}
