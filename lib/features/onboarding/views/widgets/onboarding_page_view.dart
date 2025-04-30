import 'package:flutter/material.dart';
import '../../models/onboarding_model.dart';
import 'onboarding_item.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) => OnboardingItem(
        onboardingModel: onboardingItemsList[index],
      ),
      controller: pageController,
      itemCount: onboardingItemsList.length,
    );
  }
}
