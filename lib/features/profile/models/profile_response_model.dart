import 'package:json_annotation/json_annotation.dart';
import '../../../core/shared/models/user_data_model.dart';
part 'profile_response_model.g.dart';

@JsonSerializable()
class ProfileResponseModel {
  final bool status;
  final String? message;
  @JsonKey(name: 'data')
  final UserDataModel? userData;
  const ProfileResponseModel(
      {required this.status, required this.message, required this.userData});

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseModelFromJson(json);
}
