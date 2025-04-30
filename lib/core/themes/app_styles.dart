import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle styleRegular10(BuildContext context) => TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w400,
      color: Colors.white);

  static TextStyle styleRegular12(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 12),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        color: const Color(0xffAAAAAA),
      );

  static TextStyle styleRegular14(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w400,
      );
  static TextStyle styleRegular16(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w400,
      );
  static TextStyle styleMedium16(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w500,
      );

  static TextStyle styleSemiBold16(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        color: const Color(0xff064061),
      );

  static TextStyle styleBold16(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        color: const Color(0xff4EB7F2),
      );

  static TextStyle styleRegular18(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w400,
      );

  static TextStyle styleMedium18(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w500,
      );

  static TextStyle styleSemiBold18(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w600,
      );
  static TextStyle styleRegular20(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w400,
      );

  static TextStyle styleMedium20(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w500,
      );

  static TextStyle styleSemiBold20(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w600,
      );
  static TextStyle styleSemiBold24(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 24),
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w600,
      );
  static TextStyle styleBold24(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 24),
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w700,
      );

  static TextStyle styleMedium28(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 28),
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w500,
      );
  static TextStyle styleSemiBold28(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 28),
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w600,
      );
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return width / 412;
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;
  double responsiveFontSize = fontSize * getScaleFactor(context);
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}
