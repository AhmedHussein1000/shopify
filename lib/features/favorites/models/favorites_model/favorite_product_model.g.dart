// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteProductModel _$FavoriteProductModelFromJson(
        Map<String, dynamic> json) =>
    FavoriteProductModel(
      id: (json['id'] as num).toInt(),
      price: (json['price'] as num?)?.toInt(),
      oldPrice: (json['old_price'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toInt(),
      image: json['image'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$FavoriteProductModelToJson(
        FavoriteProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'discount': instance.discount,
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
    };
