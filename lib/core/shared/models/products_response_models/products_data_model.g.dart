// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsDataModel _$ProductsDataModelFromJson(Map<String, dynamic> json) =>
    ProductsDataModel(
      products: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsDataModelToJson(ProductsDataModel instance) =>
    <String, dynamic>{
      'data': instance.products,
    };
