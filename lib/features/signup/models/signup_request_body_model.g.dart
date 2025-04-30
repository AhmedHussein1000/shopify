// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequestBodyModel _$SignupRequestBodyModelFromJson(
        Map<String, dynamic> json) =>
    SignupRequestBodyModel(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$SignupRequestBodyModelToJson(
        SignupRequestBodyModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
    };
