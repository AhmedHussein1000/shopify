// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoritesDataModel _$FavoritesDataModelFromJson(Map<String, dynamic> json) =>
    FavoritesDataModel(
      favoritesData: (json['data'] as List<dynamic>?)
          ?.map((e) => FavoriteItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FavoritesDataModelToJson(FavoritesDataModel instance) =>
    <String, dynamic>{
      'data': instance.favoritesData,
    };
