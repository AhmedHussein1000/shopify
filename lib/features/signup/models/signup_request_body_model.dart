import 'package:json_annotation/json_annotation.dart';
part 'signup_request_body_model.g.dart';

@JsonSerializable()
class SignupRequestBodyModel  {
  final String name;
  final String email;
  final String password;
  final String phone;
  const SignupRequestBodyModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.phone});
  toJson() => _$SignupRequestBodyModelToJson(this);
}
