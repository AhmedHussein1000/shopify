import 'package:json_annotation/json_annotation.dart';
part 'about_us_data_model.g.dart';

@JsonSerializable()
class AboutUsDataModel  {
  final String? about;
  final String? terms;

  const AboutUsDataModel({required this.about,required this.terms});

  factory AboutUsDataModel.fromJson(Map<String, dynamic> json) =>
      _$AboutUsDataModelFromJson(json);
}
