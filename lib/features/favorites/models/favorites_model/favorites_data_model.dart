import 'package:json_annotation/json_annotation.dart';

import 'favorite_item_model.dart';
part 'favorites_data_model.g.dart';

@JsonSerializable()
class FavoritesDataModel {
  @JsonKey(name: 'data')
  final List<FavoriteItemModel>? favoritesData;

  const FavoritesDataModel({
    required this.favoritesData,
  });

  factory FavoritesDataModel.fromJson(Map<String, dynamic> json) =>
      _$FavoritesDataModelFromJson(json);
}
