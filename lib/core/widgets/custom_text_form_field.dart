import 'package:flutter/material.dart';
import 'package:shop_app/core/helpers/extensions.dart';
import 'package:shop_app/core/themes/app_colors.dart';
import 'package:shop_app/core/utils/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.prefixIconData,
      this.obscureText,
      this.keyboardType,
       this.controller,
      required this.labelText,
      this.suffixIcon});
  final String hintText;
  final IconData prefixIconData;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String labelText;
  final IconButton? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.bluePrimaryColor,
      validator: (value) {
        if (value.isNullOrEmpty()) {
          return AppConstants.fieldRequired;
        }
        return null;
      },
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: Icon(
            prefixIconData,
          )),
    );
  }
}
