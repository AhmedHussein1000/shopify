import 'package:flutter/material.dart';
import '../../../../core/cache/shared_preferences_helper.dart';
import '../../../../core/cache/cache_keys.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/themes/app_styles.dart';
import '../../models/onboarding_model.dart';

class OnboardingSkippingButtons extends StatefulWidget {
  const OnboardingSkippingButtons({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<OnboardingSkippingButtons> createState() =>
      _OnboardingSkippingButtonsState();
}

class _OnboardingSkippingButtonsState extends State<OnboardingSkippingButtons> {
  int currentPage = 0;
  @override
  void initState() {
    widget.pageController.addListener(_pageListener);
    super.initState();
  }

  void _pageListener() {
    if (widget.pageController.page != null) {
      setState(() {
        currentPage = widget.pageController.page!.round();
      });
    }
  }

  @override
  void dispose() {
    widget.pageController.removeListener(_pageListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () async {
                await cacheOnboardingThenNavigateToLogin(context);
              },
              child: Text(
                'Skip',
                style: Styles.styleMedium18(context),
              )),
          ElevatedButton(
            onPressed: () async {
              if (currentPage < onboardingItemsList.length - 1) {
                widget.pageController.nextPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeIn);
              } else {
                await cacheOnboardingThenNavigateToLogin(context);
              }
            },
            child: Text(
              currentPage < onboardingItemsList.length - 1
                  ? 'Next'
                  : 'Get Started',
              style: Styles.styleMedium18(context),
            ),
          )
        ],
      ),
    );
  }

  Future<void> cacheOnboardingThenNavigateToLogin(BuildContext context) async {
    await SharedPrefencesHelper.saveData<bool>(
        key: CacheKeys.onBoarding, value: true);
    if (!context.mounted) return;
    context.pushNamedAndRemoveUntil(
      Routes.login,
      predicate: (route) => false,
    );
  }
}
