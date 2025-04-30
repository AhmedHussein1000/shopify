import 'package:flutter/material.dart';
import '../../../../core/themes/app_styles.dart';
import '../../models/settings_item_model.dart';

class CustomSettingListTile extends StatelessWidget {
  const CustomSettingListTile({
    super.key,
    required this.settingsItemModel,
  });
  final SettingsItemModel settingsItemModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: settingsItemModel.leading,
      title: Text(
        settingsItemModel.title,
        style: Styles.styleRegular18(context),
      ),
      trailing: settingsItemModel.trailing,
    );
  }
}
