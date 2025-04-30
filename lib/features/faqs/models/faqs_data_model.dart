import 'package:json_annotation/json_annotation.dart';

import 'faqs_item_model.dart';
part 'faqs_data_model.g.dart';

@JsonSerializable()
class FAQsData {
  @JsonKey(name: 'data')
  final List<FAQsItemModel>? faqsData;

  const FAQsData({
    required this.faqsData,
  });

  factory FAQsData.fromJson(Map<String, dynamic> json) =>
      _$FAQsDataFromJson(json);
}
