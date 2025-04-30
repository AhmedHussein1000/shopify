import 'package:json_annotation/json_annotation.dart';
import '../../../core/shared/models/user_data_model.dart';
part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final bool status;
  final String? message;
  @JsonKey(name: 'data')
  final UserDataModel? userData;
  const LoginResponseModel(
      {required this.status, required this.message, required this.userData});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}
