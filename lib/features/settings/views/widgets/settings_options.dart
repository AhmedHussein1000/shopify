import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/addresses/views/addresses_view.dart';
import '../../../about_us/views/about_us_view.dart';
import '../../../change_password/views/change_password_view.dart';
import '../../../contact_us/views/contacts_view.dart';
import '../../../faqs/views/faqs_view.dart';
import '../../../profile/views/edit_profile_view.dart';
import '../../../../core/cache/cache_keys.dart';
import '../../../../core/cache/shared_preferences_helper.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/size_config.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/custom_awesome_dialog.dart';
import '../../../../core/widgets/custom_divider.dart';
import '../../models/settings_item_model.dart';
import 'profile_header.dart';
import 'custom_related_settings.dart';
import '../../../../core/shared/view_models/theme_cubit/theme_cubit.dart';

class SettingsOptionsContainer extends StatelessWidget {
  const SettingsOptionsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth - 32,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 24),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 10,
              offset: Offset(0, -2),
              spreadRadius: 8,
            )
          ]),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileHeader(),
            const CustomDivider(),
            _buildAccountSettings(context),
            const CustomDivider(),
            _buildGeneralSettings(context),
            const CustomDivider(),
            _buildAboutAppSettings(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountSettings(BuildContext context) {
    return CustomRelatedSettings(
      relatedSettingsTitle: 'Account Settings',
      settingsItems: [
        _createSettingsItem(context,
            title: 'My Addresses',
            screen: const AddressesView(),
            icon: Icons.location_on),
        _createSettingsItem(context,
            title: 'Edit profile',
            screen: const EditProfileView(),
            icon: Icons.person),
        _createSettingsItem(
          context,
          title: 'Change Password',
          screen: const ChangePasswordView(),
          icon: Icons.lock,
        ),
        _createLogoutItem(context),
      ],
    );
  }

  Widget _buildGeneralSettings(BuildContext context) {
    return CustomRelatedSettings(
      relatedSettingsTitle: 'General Settings',
      settingsItems: [
        SettingsItemModel(
          title: 'Dark Mode',
          trailing: BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, state) => Switch(
              value: state == ThemeMode.dark,
              onChanged: (value) => context.read<ThemeCubit>().changeTheme(),
            ),
          ),
        ),
     const   SettingsItemModel(
            title: 'Language',
            leading: Icon(Icons.language),
            trailing: Icon(Icons.arrow_forward_ios)),
      ],
    );
  }

  Widget _buildAboutAppSettings(BuildContext context) {
    return CustomRelatedSettings(relatedSettingsTitle: 'Legal', settingsItems: [
      _createSettingsItem(context,
          title: 'FAQs', screen: const FAQsView(), icon: Icons.help),
      _createSettingsItem(context,
          title: 'Contact Us',
          screen: const ContactUsView(),
          icon: Icons.contact_mail),
      _createSettingsItem(context,
          title: 'About Us', screen: const AboutUsView(), icon: Icons.info),
    ]);
  }

  SettingsItemModel _createSettingsItem(BuildContext context,
      {required String title, required Widget screen, IconData? icon}) {
    return SettingsItemModel(
      title: title,
      leading: icon != null ? Icon(icon) : null,
      trailing: IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: () => context.pushPersistentScreen(screen)),
    );
  }

  SettingsItemModel _createLogoutItem(BuildContext context) {
    return SettingsItemModel(
      title: 'Logout',
      trailing: IconButton(
        icon: const Icon(Icons.logout_outlined, color: Colors.red),
        onPressed: () => _handleLogoutButton(context),
      ),
    );
  }

  AwesomeDialog _handleLogoutButton(BuildContext context) {
    return customAwesomeDialog(
      context: context,
      desc: 'Are you sure you want to logout?',
      btnOkOnPress: () async {
        await SharedPrefencesHelper.removeData(CacheKeys.token);

        await Future.delayed(const Duration(milliseconds: 100));
        if (!context.mounted) return;
        Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
          Routes.login,
          (route) => false,
        );
      },
    );
  }
}
