import 'package:json_annotation/json_annotation.dart';

import 'about_us_data_model.dart';
part 'about_us_model.g.dart';

@JsonSerializable()
class AboutUsModel {
  final bool status;
  final String? message;
  final AboutUsDataModel? data;

  const AboutUsModel(
      {required this.status, required this.message, required this.data});

  factory AboutUsModel.fromJson(Map<String, dynamic> json) =>
      _$AboutUsModelFromJson(json);
}
