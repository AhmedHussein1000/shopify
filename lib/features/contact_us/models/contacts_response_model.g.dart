// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactsResponseModel _$ContactsResponseModelFromJson(
        Map<String, dynamic> json) =>
    ContactsResponseModel(
      status: json['status'] as bool,
      message: json['message'] as String?,
      contactsData: json['data'] == null
          ? null
          : ContactsDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContactsResponseModelToJson(
        ContactsResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.contactsData,
    };
