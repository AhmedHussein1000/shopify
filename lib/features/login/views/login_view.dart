import 'package:flutter/material.dart';
import 'widgets/login_view_body.dart';
import '../../../core/helpers/size_config.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const Scaffold(
      extendBodyBehindAppBar: true,
      body: LoginViewBody(),
    );
  }
}
