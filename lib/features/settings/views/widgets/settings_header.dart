import 'package:flutter/material.dart';
import '../../../../core/helpers/size_config.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_styles.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig.screenHeight * 0.35,
      padding: const EdgeInsets.only(left: 16, top: 56),
      decoration: const BoxDecoration(
        color: AppColors.bluePrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Icon(
          Icons.settings,
          size: 40,
          color: Colors.white,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          'Settings',
          style: Styles.styleMedium28(context).copyWith(color: Colors.white),
        )
      ]),
    );
  }
}
