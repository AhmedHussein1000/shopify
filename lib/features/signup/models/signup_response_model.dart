import 'package:json_annotation/json_annotation.dart';
import '../../../core/shared/models/user_data_model.dart';
part 'signup_response_model.g.dart';

@JsonSerializable()
class SignupResponseModel {
  final bool status;
  final String? message;
  @JsonKey(name: 'data')
  final UserDataModel? userData;
  const SignupResponseModel(
      {required this.status,
      required this.message,
      required this.userData});

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseModelFromJson(json);
}
