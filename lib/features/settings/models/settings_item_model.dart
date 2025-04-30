import 'package:flutter/material.dart';

class SettingsItemModel {
  final String title;
  final Widget trailing;
  final Widget? leading;
  const SettingsItemModel({
    required this.title,
    required this.trailing,
    this.leading,
  });
}
