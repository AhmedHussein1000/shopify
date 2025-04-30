import 'package:flutter/material.dart';
import '../../../../core/themes/app_styles.dart';
import '../../../../core/widgets/have_account_or_not.dart';
import 'signup_form.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            'Create Account',
            style: Styles.styleSemiBold28(context),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Join our community and start shopping today',
            style: Styles.styleMedium18(context).copyWith(color: Colors.grey),
          ),
          const SizedBox(
            height: 16,
          ),
          const SignupForm(),
          const SizedBox(
            height: 8,
          ),
          const HaveAnAccountOrNot(
            isLoginView: false,
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    ));
  }
}
