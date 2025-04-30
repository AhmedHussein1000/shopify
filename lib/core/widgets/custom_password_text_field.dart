import 'package:flutter/material.dart';
import 'custom_text_form_field.dart';


class CustomPasswordTextField extends StatelessWidget {
  const CustomPasswordTextField({
    super.key,
    required this.isObscureValueNotifier,
    required this.passwordController,
  });

  final ValueNotifier<bool> isObscureValueNotifier;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isObscureValueNotifier,
        builder: (context, isObscure, child) => CustomTextFormField(
              controller: passwordController,
                 suffixIcon: IconButton(onPressed: ()=> isObscureValueNotifier.value=!isObscure, icon: 
                      Icon(isObscure? Icons.visibility:Icons.visibility_off)
                    ) ,
            hintText: 'Enter your Password',
            labelText: 'Password',
            prefixIconData: Icons.password_outlined,
            obscureText: isObscure ,
            ));
  }
}