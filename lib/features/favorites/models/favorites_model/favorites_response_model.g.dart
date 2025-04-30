// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoritesResponseModel _$FavoritesResponseModelFromJson(
        Map<String, dynamic> json) =>
    FavoritesResponseModel(
      status: json['status'] as bool,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : FavoritesDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoritesResponseModelToJson(
        FavoritesResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
