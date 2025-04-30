// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesResponseModel _$CategoriesResponseModelFromJson(
        Map<String, dynamic> json) =>
    CategoriesResponseModel(
      status: json['status'] as bool,
      message: json['message'] as String?,
      categoriesData: json['data'] == null
          ? null
          : CategoriesDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoriesResponseModelToJson(
        CategoriesResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.categoriesData,
    };
