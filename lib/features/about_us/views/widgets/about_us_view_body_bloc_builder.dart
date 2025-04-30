import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../../core/widgets/custom_text_message.dart';
import '../../view_models/about_us_cubit/about_us_cubit.dart';
import 'about_us_view_body.dart';

class AboutUsViewBodyBlocBuilder extends StatelessWidget {
  const AboutUsViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutUsCubit, AboutUsState>(
      builder: (context, state) {
        if (state is AboutUsSuccess) {
          return AboutUsViewBody(
              aboutUsText: state.aboutUsData.about ?? '',
              termsText: state.aboutUsData.terms ?? '');
        } else if (state is AboutUsFailure) {
          return CustomTextMessage(text: state.message);
        } else {
          return const CustomCircularProgressIndicator();
        }
      },
    );
  }
}
