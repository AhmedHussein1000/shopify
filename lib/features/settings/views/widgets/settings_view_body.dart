import 'package:flutter/material.dart';
import '../../../../core/helpers/size_config.dart';
import 'settings_header.dart';
import 'settings_options.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      const SettingsHeader(),
      Positioned(
        top: SizeConfig.screenHeight * 0.175,
        bottom: 0,
        child: const SettingsOptionsContainer(),
      )
    ]);
  }
}
