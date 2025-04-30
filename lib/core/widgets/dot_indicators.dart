import 'package:flutter/material.dart';
import 'package:shop_app/core/themes/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotIndicators extends StatelessWidget {
  const DotIndicators({super.key, required this.pageController, required this.count});
  final PageController pageController;
  final int count;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: count,
      effect: const ExpandingDotsEffect(
        activeDotColor: AppColors.bluePrimaryColor,
        dotColor: AppColors.grey,
        dotHeight: 8,
        dotWidth: 8,
        radius: 8,
        expansionFactor: 4,
        spacing: 5,
      ),
    );
  }
}
