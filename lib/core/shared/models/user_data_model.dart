import 'package:json_annotation/json_annotation.dart';

part 'user_data_model.g.dart';

@JsonSerializable()
class UserDataModel {
  final String? name;
  final String? email;
  final String? phone;
  final String? token;
  const UserDataModel(
      {required this.name,
      required this.email,
      required this.phone,
      required this.token});

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);
}
