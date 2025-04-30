import 'package:json_annotation/json_annotation.dart';

import 'contacts_data_model.dart';
part 'contacts_response_model.g.dart';

@JsonSerializable()
class ContactsResponseModel {
  final bool status;
  final String? message;
  @JsonKey(name: 'data')
  final ContactsDataModel? contactsData;

  const ContactsResponseModel(
      {required this.status,
      required this.message,
      required this.contactsData});

  factory ContactsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponseModelFromJson(json);
}
