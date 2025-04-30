// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesDataModel _$CategoriesDataModelFromJson(Map<String, dynamic> json) =>
    CategoriesDataModel(
      categoriesList: (json['data'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriesDataModelToJson(
        CategoriesDataModel instance) =>
    <String, dynamic>{
      'data': instance.categoriesList,
    };
