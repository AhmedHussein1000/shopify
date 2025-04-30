// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteItemModel _$FavoriteItemModelFromJson(Map<String, dynamic> json) =>
    FavoriteItemModel(
      id: (json['id'] as num).toInt(),
      product: json['product'] == null
          ? null
          : FavoriteProductModel.fromJson(
              json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoriteItemModelToJson(FavoriteItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
    };
