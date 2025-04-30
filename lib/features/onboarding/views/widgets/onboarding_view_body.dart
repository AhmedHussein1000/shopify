import 'package:flutter/material.dart';
import '../../../../core/widgets/dot_indicators.dart';
import '../../models/onboarding_model.dart';
import 'onboarding_page_view.dart';
import 'onboarding_skipping_buttons.dart';
import '../../../../core/helpers/size_config.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return SafeArea(
      child: Column(
        children: [
          Expanded(child: OnboardingPageView(pageController: pageController)),
          DotIndicators(
            pageController: pageController,
            count: onboardingItemsList.length,
          ),
          const SizedBox(
            height: 20,
          ),
          OnboardingSkippingButtons(pageController: pageController),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
