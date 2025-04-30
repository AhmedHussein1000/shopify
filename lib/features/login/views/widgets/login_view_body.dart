import 'package:flutter/material.dart';
import '../../../../core/helpers/assets.dart';
import '../../../../core/helpers/size_config.dart';
import '../../../../core/themes/app_styles.dart';
import '../../../../core/widgets/have_account_or_not.dart';
import 'login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(40)),
            child: Image.asset(
              Assets.imagesShoppingLogin,
              height: SizeConfig.screenHeight * 0.4,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Welcome Back!',
                  style: Styles.styleSemiBold28(context),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Login now to see our hot offers',
                  style: Styles.styleMedium18(context)
                      .copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 24,
                ),
                const LoginForm(),
                const SizedBox(
                  height: 8,
                ),
                const HaveAnAccountOrNot(
                  isLoginView: true,
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
