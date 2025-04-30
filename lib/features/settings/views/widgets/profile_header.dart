import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../profile/view_models/profile_cubit/profile_cubit.dart';
import '../../../../core/themes/app_styles.dart';
import '../../../../core/widgets/custom_profile_image.dart';
import '../../../../core/widgets/custom_text_message.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ProfileCubit, ProfileState>(
  buildWhen: (previous, current) => 
    current is ProfileSuccess || 
    current is ProfileLoading || 
    current is ProfileFailure ,
      builder: (context, state) {
        if (state is ProfileSuccess) {
          return UsernameAndImage(
            name: state.profileResponseModel.userData?.name,
          );
        } else if (state is ProfileFailure) {
          return CustomTextMessage(text: state.message);
        } else {
          return const Skeletonizer(enabled: true, child: UsernameAndImage());
        }
      },
    );
  }
}

class UsernameAndImage extends StatelessWidget {
  const UsernameAndImage({
    super.key,
    this.name,
  });

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomProfileImage(
          parentCircleRadius: 26,
          childCircleRadius: 25,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          name ?? 'unknown user',
          style: Styles.styleRegular16(context),
        )
      ],
    );
  }
}
