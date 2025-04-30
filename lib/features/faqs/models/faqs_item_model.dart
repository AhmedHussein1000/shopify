import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'faqs_item_model.g.dart';

@JsonSerializable()
class FAQsItemModel extends Equatable {
  final int id;
  final String? question;
  final String? answer;

  const FAQsItemModel(
      {required this.id, required this.question, required this.answer});

  factory FAQsItemModel.fromJson(Map<String, dynamic> json) =>
      _$FAQsItemModelFromJson(json);

  @override
  List<Object?> get props => [id];
}
