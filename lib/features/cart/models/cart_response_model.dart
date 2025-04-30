import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'cart_data_model.dart';
part 'cart_response_model.g.dart';

@JsonSerializable()
class CartResponseModel extends Equatable {
  final bool status;
  final String? message;
  @JsonKey(name: 'data')
  final CartDataModel? cartData;

  const CartResponseModel({required this.status, this.message, this.cartData});

  factory CartResponseModel.fromJson(Map<String, dynamic> json) => _$CartResponseModelFromJson(json);

  @override
  List<Object?> get props => [status, message, cartData];
}
