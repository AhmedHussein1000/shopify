import 'package:flutter/material.dart';
import '../../../core/helpers/size_config.dart';
import 'widgets/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const Scaffold(
      body: SettingsViewBody(),
    );
  }
}
