import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/show_toast.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/themes/app_styles.dart';
import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../models/login_request_body_model.dart';
import '../../view_models/login_cubit/login_cubit.dart';

class LoginButtonBlocConsumer extends StatelessWidget {
  const LoginButtonBlocConsumer({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.emailController,
    required this.passwordController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.pushNamedAndRemoveUntil(
            Routes.mainLayout,
            predicate: (route) => false,
          );
        }
        if (state is LoginFailure) {
          customToast(state.message, ToastStates.error);
        }
      },
      builder: (context, state) {
      return state is LoginLoading ?
           const CustomCircularProgressIndicator()
        :
         SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<LoginCubit>().login(
                      loginRequestBody: LoginRequestBodyModel(
                          email: emailController.text,
                          password: passwordController.text));
                }
              },
              child: Text(
                'Login',
                style: Styles.styleSemiBold20(context),
              )),
        );
      },
    );
  }
}
