import 'package:json_annotation/json_annotation.dart';
import 'faqs_data_model.dart';
part 'faqs_model.g.dart';

@JsonSerializable()
class FAQsModel {
  final bool status;
  final String? message;
  @JsonKey(name: 'data')
  final FAQsData? faqsData;

  const FAQsModel(
      {required this.status, required this.message, required this.faqsData});

  factory FAQsModel.fromJson(Map<String, dynamic> json) =>
      _$FAQsModelFromJson(json);
}
