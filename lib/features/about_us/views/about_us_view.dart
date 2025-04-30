import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/service_locator.dart';
import '../view_models/about_us_cubit/about_us_cubit.dart';
import 'widgets/about_us_view_body_bloc_builder.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AboutUsCubit(getIt())..getAboutUsAndTerms(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('About us & Terms'),
          ),
          body: const AboutUsViewBodyBlocBuilder()),
    );
  }
}
