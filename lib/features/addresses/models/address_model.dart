import 'package:json_annotation/json_annotation.dart';
part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  final int id;
  final String? name;
  final String? city;
  final String? region;
  final String? details;
  final String? notes;
  final double? latitude;
  final double? longitude;

  const AddressModel(
      {required this.id,
      required this.name,
      required this.city,
      required this.region,
      required this.details,
      required this.notes,
      this.latitude = 30.0616863,
      this.longitude = 31.3260088});

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
