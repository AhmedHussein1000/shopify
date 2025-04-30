import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/show_toast.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/themes/app_styles.dart';
import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../view_models/profile_cubit/profile_cubit.dart';

class EditProfileButtonBlocConsumer extends StatefulWidget {
  const EditProfileButtonBlocConsumer({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.nameController,
    required this.phoneController,
    required this.email,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final String email;

  @override
  State<EditProfileButtonBlocConsumer> createState() =>
      _EditProfileButtonBlocConsumerState();
}

class _EditProfileButtonBlocConsumerState
    extends State<EditProfileButtonBlocConsumer> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) =>
          current is EditProfileSuccess || current is EditProfileFailure,
      listener: (context, state) {
        if (state is EditProfileSuccess) {
          customToast('Profile Edited Successfully', ToastStates.success);
          context.pop();
        }
        if (state is EditProfileFailure) {
          customToast(state.message, ToastStates.error);
        }
      },
      buildWhen: (previous, current) =>
          current is EditProfileLoading ||
          current is EditProfileFailure ||
          current is EditProfileSuccess,
      builder: (context, state) {
        return state is EditProfileLoading
            ? const CustomCircularProgressIndicator()
            : SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (widget._formKey.currentState!.validate()) {
                        context.read<ProfileCubit>().editProfile(
                            name: widget.nameController.text,
                            phone: widget.phoneController.text,
                            email: widget.email);
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
