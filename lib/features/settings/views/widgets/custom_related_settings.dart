import 'package:flutter/material.dart';
import '../../../../core/themes/app_styles.dart';
import '../../models/settings_item_model.dart';
import 'custom_list_tile.dart';

class CustomRelatedSettings extends StatelessWidget {
  const CustomRelatedSettings({
    super.key,
    required this.settingsItems,
    required this.relatedSettingsTitle,
  });

  final List<SettingsItemModel> settingsItems;
  final String relatedSettingsTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          relatedSettingsTitle,
          style: Styles.styleRegular18(context)
              .copyWith(color: const Color(0xffADADAD)),
        ),
        ...List.generate(
            settingsItems.length,
            (index) => Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: CustomSettingListTile(
                    settingsItemModel: settingsItems[index],
                  ),
                )),
      ],
    );
  }
}
