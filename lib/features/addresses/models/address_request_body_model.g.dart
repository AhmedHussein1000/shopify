// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_request_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressRequestBodyModel _$AddressRequestBodyModelFromJson(
        Map<String, dynamic> json) =>
    AddressRequestBodyModel(
      name: json['name'] as String,
      city: json['city'] as String,
      region: json['region'] as String,
      details: json['details'] as String,
      notes: json['notes'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AddressRequestBodyModelToJson(
        AddressRequestBodyModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'city': instance.city,
      'region': instance.region,
      'details': instance.details,
      'notes': instance.notes,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
