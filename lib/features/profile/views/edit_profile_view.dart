import 'package:flutter/material.dart';
import '../../../core/helpers/size_config.dart';
import 'widgets/edit_profile_body_bloc_builder.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Edit Profile'),
        ),
        body: const EditProfileBodyBlocBuilder());
  }
}
