import 'package:json_annotation/json_annotation.dart';

import 'categories_data_model.dart';
part 'categories_response_model.g.dart';

@JsonSerializable()
class CategoriesResponseModel {
  final bool status;
  final String? message;
  @JsonKey(name: 'data')
  final CategoriesDataModel? categoriesData;

  const CategoriesResponseModel(
      {required this.status,
      required this.message,
      required this.categoriesData});

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseModelFromJson(json);
}
