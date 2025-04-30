// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faqs_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FAQsItemModel _$FAQsItemModelFromJson(Map<String, dynamic> json) =>
    FAQsItemModel(
      id: (json['id'] as num).toInt(),
      question: json['question'] as String?,
      answer: json['answer'] as String?,
    );

Map<String, dynamic> _$FAQsItemModelToJson(FAQsItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
    };
