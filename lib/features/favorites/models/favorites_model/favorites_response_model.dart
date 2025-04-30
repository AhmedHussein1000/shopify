import 'package:json_annotation/json_annotation.dart';

import 'favorites_data_model.dart';
part 'favorites_response_model.g.dart';

@JsonSerializable()
class FavoritesResponseModel {
  final bool status;
  final String? message;
  final FavoritesDataModel? data;

  const FavoritesResponseModel({required this.status, this.message, this.data});

  factory FavoritesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FavoritesResponseModelFromJson(json);
}
