import 'package:json_annotation/json_annotation.dart';

import 'contact_model.dart';
part 'contacts_data_model.g.dart';

@JsonSerializable()
class ContactsDataModel {
  @JsonKey(name: 'data')
  final List<ContactModel>? contactsList;

  const ContactsDataModel({
    required this.contactsList,
  });

  factory ContactsDataModel.fromJson(Map<String, dynamic> json) =>
      _$ContactsDataModelFromJson(json);
}
