// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addresses_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressesResponseModel _$AddressesResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddressesResponseModel(
      status: json['status'] as bool,
      message: json['message'] as String?,
      addressesData: json['data'] == null
          ? null
          : AddressesListModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressesResponseModelToJson(
        AddressesResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.addressesData,
    };
