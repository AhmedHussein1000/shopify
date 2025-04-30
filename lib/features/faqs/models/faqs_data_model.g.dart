// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faqs_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FAQsData _$FAQsDataFromJson(Map<String, dynamic> json) => FAQsData(
      faqsData: (json['data'] as List<dynamic>?)
          ?.map((e) => FAQsItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FAQsDataToJson(FAQsData instance) => <String, dynamic>{
      'data': instance.faqsData,
    };
