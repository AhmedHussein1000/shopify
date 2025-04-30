import 'package:flutter/material.dart';
import 'login_button_bloc_consumer.dart';
import '../../../../core/helpers/size_config.dart';
import '../../../../core/themes/app_styles.dart';
import '../../../../core/widgets/custom_password_text_field.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> isObscureValueNotifier = ValueNotifier(true);
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Enter your Email Address',
            keyboardType: TextInputType.emailAddress,
            prefixIconData: Icons.email_outlined,
            controller: emailController,
            labelText: 'Email',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomPasswordTextField(
              isObscureValueNotifier: isObscureValueNotifier,
              passwordController: passwordController),
          const SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Forget Password?',
                style: Styles.styleSemiBold18(context),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          LoginButtonBlocConsumer(
              formKey: _formKey,
              emailController: emailController,
              passwordController: passwordController)
        ],
      ),
    );
  }
}
