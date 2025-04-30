import 'package:flutter/material.dart';

import '../../../../core/themes/app_styles.dart';
import '../../../../core/widgets/custom_divider.dart';

class AboutUsViewBody extends StatelessWidget {
  const AboutUsViewBody(
      {super.key, required this.aboutUsText, required this.termsText});
  final String aboutUsText;
  final String termsText;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'About us',
                    style: Styles.styleBold24(context),
                  ),
                ),
                Text(
                  aboutUsText,
                  style: Styles.styleRegular20(context),
                ),
                const CustomDivider(),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Terms',
                    style: Styles.styleBold24(context),
                  ),
                ),
                Text(
                  termsText,
                  style: Styles.styleRegular20(context),
                ),
              ],
            )));
  }
}
