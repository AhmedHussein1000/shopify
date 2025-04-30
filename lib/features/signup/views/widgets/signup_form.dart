import 'package:flutter/material.dart';
import 'signup_button_bloc_consumer.dart';
import '../../../../core/widgets/custom_password_text_field.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm>
    with AutomaticKeepAliveClientMixin {
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> isObscureValueNotifier = ValueNotifier(true);
  late final TextEditingController usernameController;
  late final TextEditingController phoneController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  bool isSecured = true;
  @override
  void initState() {
    usernameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Form(
      key: _formKey,
      child: Column(
        spacing: 16,
        children: [
          CustomTextFormField(
            hintText: 'Enter your username',
            keyboardType: TextInputType.text,
            prefixIconData: Icons.person_2_outlined,
            controller: usernameController,
            labelText: 'username',
          ),
          CustomTextFormField(
            hintText: 'Enter your Email Address',
            keyboardType: TextInputType.emailAddress,
            prefixIconData: Icons.email_outlined,
            controller: emailController,
            labelText: 'Email',
          ),
          CustomPasswordTextField(
            isObscureValueNotifier: isObscureValueNotifier,
            passwordController: passwordController,
          ),
          CustomTextFormField(
            hintText: 'Enter your phone number',
            keyboardType: TextInputType.phone,
            prefixIconData: Icons.phone_android_outlined,
            controller: phoneController,
            labelText: 'Phone Number',
          ),
          SignupButtonBlocConsumer(
              formKey: _formKey,
              usernameController: usernameController,
              emailController: emailController,
              passwordController: passwordController,
              phoneController: phoneController)
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
