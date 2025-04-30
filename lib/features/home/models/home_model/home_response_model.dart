import 'package:json_annotation/json_annotation.dart';

import 'home_data_model.dart';
part 'home_response_model.g.dart';

@JsonSerializable()
class HomeResponseModel {
  final bool status;
  final String? message;
  @JsonKey(name: 'data')
  final HomeDataModel? homeData;

  const HomeResponseModel(
      {required this.status, required this.message, required this.homeData});

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseModelFromJson(json);
}
