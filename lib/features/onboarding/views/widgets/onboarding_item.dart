import 'package:flutter/material.dart';
import '../../../../core/themes/app_styles.dart';
import '../../models/onboarding_model.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key, required this.onboardingModel});
  final OnboardingModel onboardingModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 300,
              minHeight: 200,
            ),
            child: Image.asset(
              onboardingModel.image,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(onboardingModel.title,
            textAlign: TextAlign.center, style: Styles.styleBold24(context)),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(onboardingModel.subTitle,
              textAlign: TextAlign.center,
              style:
                  Styles.styleMedium18(context).copyWith(color: Colors.grey)),
        ),
        const Spacer(),
      ],
    );
  }
}
