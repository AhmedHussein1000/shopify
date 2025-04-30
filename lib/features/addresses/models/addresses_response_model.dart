import 'package:json_annotation/json_annotation.dart';
import 'package:shop_app/features/addresses/models/addresses_list_model.dart';

part 'addresses_response_model.g.dart';

@JsonSerializable()
class AddressesResponseModel {
  final bool status;
  final String? message;
  @JsonKey(name: 'data')
  final AddressesListModel? addressesData;

  const AddressesResponseModel(
      {required this.status,
      required this.message,
      required this.addressesData});
  factory AddressesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddressesResponseModelFromJson(json);
}
