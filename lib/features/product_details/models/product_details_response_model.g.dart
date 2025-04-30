// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsResponseModel _$ProductDetailsResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProductDetailsResponseModel(
      status: json['status'] as bool,
      message: json['message'] as String?,
      product: ProductModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailsResponseModelToJson(
        ProductDetailsResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.product,
    };
