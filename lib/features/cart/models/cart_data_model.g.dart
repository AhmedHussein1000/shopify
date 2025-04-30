// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartDataModel _$CartDataModelFromJson(Map<String, dynamic> json) =>
    CartDataModel(
      cartItems: (json['cart_items'] as List<dynamic>?)
          ?.map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      subTotal: json['sub_total'] as num?,
      total: json['total'] as num?,
    );

Map<String, dynamic> _$CartDataModelToJson(CartDataModel instance) =>
    <String, dynamic>{
      'cart_items': instance.cartItems,
      'sub_total': instance.subTotal,
      'total': instance.total,
    };
