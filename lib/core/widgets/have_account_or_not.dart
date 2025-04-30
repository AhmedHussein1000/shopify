import 'package:flutter/material.dart';
import 'package:shop_app/core/helpers/extensions.dart';
import 'package:shop_app/core/routes/routes.dart';
import 'package:shop_app/core/themes/app_styles.dart';

class HaveAnAccountOrNot extends StatelessWidget {
  const HaveAnAccountOrNot({super.key, required this.isLoginView});
  final bool isLoginView;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLoginView ? 'Don\'t have an account?' : 'Already have an account?',
          style: Styles.styleRegular18(context),
        ),
        const SizedBox(
          width: 5,
        ),
        TextButton(
            onPressed: () {
              isLoginView ? context.pushNamed(Routes.signup) : context.pop();
            },
            child: Text(
              isLoginView ? 'Signup' : 'Login',
              style: Styles.styleMedium18(context),
            ))
      ],
    );
  }
}
