import 'package:flutter/material.dart';
import 'change_password_button_bloc_consumer.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController currentPasswordController;
  late final TextEditingController newPasswordController;
  bool isObscureCurrentPass = true;
  bool isObscureNewPass = true;

  @override
  void initState() {
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                hintText: 'Enter your current password',
                prefixIconData: Icons.password_outlined,
                controller: currentPasswordController,
                labelText: 'Current Password',
                obscureText: isObscureCurrentPass,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscureCurrentPass = !isObscureCurrentPass;
                      });
                    },
                    icon: Icon(isObscureCurrentPass
                        ? Icons.visibility
                        : Icons.visibility_off)),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                hintText: 'Enter your new password',
                prefixIconData: Icons.password_outlined,
                controller: newPasswordController,
                labelText: 'New Password',
                obscureText: isObscureNewPass,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscureNewPass = !isObscureNewPass;
                      });
                    },
                    icon: Icon(isObscureNewPass
                        ? Icons.visibility
                        : Icons.visibility_off)),
              ),
              const SizedBox(
                height: 50,
              ),
              ChangePasswordButtonBlocConsumer(
                  formKey: _formKey,
                  currentPasswordController: currentPasswordController,
                  newPasswordController: newPasswordController)
            ],
          ),
        ),
      ),
    );
  }
}
