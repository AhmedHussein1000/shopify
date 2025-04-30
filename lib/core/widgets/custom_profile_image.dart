import 'package:flutter/material.dart';
import 'package:shop_app/core/helpers/assets.dart';
import 'package:shop_app/core/themes/app_colors.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({
    super.key,
    required this.parentCircleRadius,
    required this.childCircleRadius,
  });
  final double parentCircleRadius;
  final double childCircleRadius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: parentCircleRadius,
      backgroundColor: AppColors.bluePrimaryColor,
      child: CircleAvatar(
        radius: childCircleRadius,
        child: ClipOval(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset(
              Assets.imagesUserAvatar,
              // fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
