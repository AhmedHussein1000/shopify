import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/show_toast.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/themes/app_styles.dart';
import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../view_models/change_password_cubit/change_password_cubit.dart';

class ChangePasswordButtonBlocConsumer extends StatelessWidget {
  const ChangePasswordButtonBlocConsumer({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.currentPasswordController,
    required this.newPasswordController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController currentPasswordController;
  final TextEditingController newPasswordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          customToast("Password changed successfully", ToastStates.success);
          context.pop();
        }
        if (state is ChangePasswordFailure) {
          customToast(state.message, ToastStates.error);
        }
      },
      builder: (context, state) {
        return state is ChangePasswordLoading
            ? const CustomCircularProgressIndicator()
            : SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<ChangePasswordCubit>().changePassword(
                            currentPassword: currentPasswordController.text,
                            newPassword: newPasswordController.text);
                      }
                    },
                    child: Text(
                      'Save',
                      style: Styles.styleSemiBold20(context),
                    )),
              );
      },
    );
  }
}
