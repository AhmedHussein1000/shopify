// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faqs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FAQsModel _$FAQsModelFromJson(Map<String, dynamic> json) => FAQsModel(
      status: json['status'] as bool,
      message: json['message'] as String?,
      faqsData: json['data'] == null
          ? null
          : FAQsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FAQsModelToJson(FAQsModel instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.faqsData,
    };
