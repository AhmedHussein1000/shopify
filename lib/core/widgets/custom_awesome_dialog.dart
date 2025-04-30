import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

AwesomeDialog customAwesomeDialog(
    {required BuildContext context,
    String? title,
    required String desc,
    DialogType? type,
    required void Function()? btnOkOnPress,
    VoidCallback? onDissmissCallback}) {
  return AwesomeDialog(
    context: context,
    dialogType: type ?? DialogType.question,
    animType: AnimType.rightSlide,
    title: title,
    desc: desc,
    btnCancelOnPress: () {},
    btnOkOnPress: btnOkOnPress,
  )..show();
}
