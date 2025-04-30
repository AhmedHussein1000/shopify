import 'package:flutter/material.dart';
import 'widgets/signup_view_body.dart';
import '../../../core/helpers/size_config.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const Scaffold(
      body: SafeArea(child: SignupViewBody()),
    );
  }
}
