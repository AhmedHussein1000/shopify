import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/service_locator.dart';
import '../view_models/change_password_cubit/change_password_cubit.dart';
import 'widgets/change_password_view_body.dart';
import '../../../core/helpers/size_config.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocProvider(
      create: (context) => ChangePasswordCubit(getIt()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Change Password'),
        ),
        body: const ChangePasswordViewBody(),
      ),
    );
  }
}
