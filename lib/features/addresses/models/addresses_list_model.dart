import 'package:json_annotation/json_annotation.dart';
import 'package:shop_app/features/addresses/models/address_model.dart';

part 'addresses_list_model.g.dart';

@JsonSerializable()
class AddressesListModel {
  @JsonKey(name: 'data')
  final List<AddressModel>? addresses;

  const AddressesListModel({required this.addresses});

  factory AddressesListModel.fromJson(Map<String, dynamic> json) =>
      _$AddressesListModelFromJson(json);
}
