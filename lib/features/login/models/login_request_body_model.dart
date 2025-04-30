import 'package:json_annotation/json_annotation.dart';
part 'login_request_body_model.g.dart';

@JsonSerializable()
class LoginRequestBodyModel {
  final String email;
  final String password;
  const LoginRequestBodyModel({
    required this.email,
    required this.password,
  });
  toJson() => _$LoginRequestBodyModelToJson(this);
}
