import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Colors.black,
  primaryColor: AppColors.bluePrimaryColor,

  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        return Colors.white;
      },
    ),
    trackColor: WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.bluePrimaryColor;
        }
        return const Color(0xffEAEAEA);
      },
    ),
    trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
  ),
  // FloatingActionButton
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.bluePrimaryColor,
    foregroundColor: Colors.black,
    shape: CircleBorder(),
  ),
  // elevatedButtonTheme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      backgroundColor: AppColors.bluePrimaryColor,
      foregroundColor: Colors.black,
      elevation: 0,
      splashFactory: NoSplash.splashFactory,
    ),
  ),
  // textButtonTheme
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(AppColors.bluePrimaryColor),
    ),
  ),
  // inputDecorationTheme
  inputDecorationTheme: InputDecorationTheme(
    focusColor: AppColors.bluePrimaryColor,
    hintStyle: const TextStyle(
      color: Colors.white,
    ),
    enabledBorder: _customOutlineBorder(),
    focusedBorder: _customOutlineBorder(),
    errorBorder: _customOutlineBorder(borderColor: Colors.red),
    focusedErrorBorder: _customOutlineBorder(borderColor: Colors.red),
    labelStyle: const TextStyle(color: Colors.white),
    floatingLabelStyle: const TextStyle(color: Colors.white),
    prefixIconColor: Colors.white,
    suffixIconColor: Colors.white,
  ),
  // appBarTheme
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
        color: AppColors.bluePrimaryColor,
        fontSize: 22,
        fontWeight: FontWeight.w500,
        fontFamily: 'Rubik'),
    iconTheme: IconThemeData(color: AppColors.bluePrimaryColor),
  ),
);

OutlineInputBorder _customOutlineBorder({Color? borderColor}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(color: borderColor ?? Colors.white),
  );
}
