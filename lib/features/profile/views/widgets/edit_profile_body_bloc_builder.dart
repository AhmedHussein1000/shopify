import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_models/profile_cubit/profile_cubit.dart';
import 'edit_profile_view_body.dart';
import '../../../../core/widgets/custom_text_message.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EditProfileBodyBlocBuilder extends StatelessWidget {
  const EditProfileBodyBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
  buildWhen: (previous, current) => 
    current is ProfileSuccess || 
    current is ProfileLoading || 
    current is ProfileFailure,
        builder: (context, state) {
      if (state is ProfileSuccess) {
        return EditProfileViewBody(
          phone: state.profileResponseModel.userData!.phone!,
          username: state.profileResponseModel.userData!.name!,
          email: state.profileResponseModel.userData!.email!,
        );
      } else if (state is ProfileFailure) {
        return CustomTextMessage(
          text: state.message,
        );
      } else {
        return const Skeletonizer(
          enabled: true,
          child: EditProfileViewBody(
            username: 'username',
            phone: '0123456789',
            email: '',
          ),
        );
      }
    });
  }
}
