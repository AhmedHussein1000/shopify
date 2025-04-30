import 'package:json_annotation/json_annotation.dart';
part 'address_request_body_model.g.dart';

@JsonSerializable()
class AddressRequestBodyModel {
  final String name;
  final String city;
  final String region;
  final String details;
  final String notes;
  final double? latitude;
  final double? longitude;

  const AddressRequestBodyModel(
      {required this.name,
      required this.city,
      required this.region,
      required this.details,
      required this.notes,
      this.latitude = 30.0616863,
      this.longitude = 31.3260088});
  toJson() => _$AddressRequestBodyModelToJson(this);
}
