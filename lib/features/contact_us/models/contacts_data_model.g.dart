// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactsDataModel _$ContactsDataModelFromJson(Map<String, dynamic> json) =>
    ContactsDataModel(
      contactsList: (json['data'] as List<dynamic>?)
          ?.map((e) => ContactModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContactsDataModelToJson(ContactsDataModel instance) =>
    <String, dynamic>{
      'data': instance.contactsList,
    };
