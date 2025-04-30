// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addresses_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressesListModel _$AddressesListModelFromJson(Map<String, dynamic> json) =>
    AddressesListModel(
      addresses: (json['data'] as List<dynamic>?)
          ?.map((e) => AddressModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddressesListModelToJson(AddressesListModel instance) =>
    <String, dynamic>{
      'data': instance.addresses,
    };
