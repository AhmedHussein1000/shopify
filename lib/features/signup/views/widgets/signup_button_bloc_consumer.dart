import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/show_toast.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/themes/app_styles.dart';
import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../models/signup_request_body_model.dart';
import '../../view_models/signup_cubit/signup_cubit.dart';

class SignupButtonBlocConsumer extends StatelessWidget {
  const SignupButtonBlocConsumer({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
    required this.phoneController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          customToast(
              state.signupResponse.message ??
                  'Account has created successfully',
              ToastStates.success);
          context.pop();
        }

        if (state is SignupFailure) {
          customToast(state.message, ToastStates.error);
        }
      },
      builder: (context, state) {
        if (state is SignupLoading) {
          return const CustomCircularProgressIndicator();
        }
        return Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: SizedBox(
            
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<SignupCubit>().signup(
                        signupRequestBody: SignupRequestBodyModel(
                            name: usernameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            phone: phoneController.text));
                  }
                },
                child: Text(
                  'Sign up',
                  style: Styles.styleSemiBold20(context),
                )),
          ),
        );
      },
    );
  }
}
