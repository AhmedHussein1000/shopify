
import 'package:flutter/material.dart';
import 'package:shop_app/core/themes/app_colors.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    super.key, this.indicatorColor,
  });
final Color? indicatorColor;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(
        color: indicatorColor??AppColors.bluePrimaryColor,
      ),
    );
  }
}