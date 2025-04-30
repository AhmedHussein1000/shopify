import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'cart_item_model.dart';
part 'cart_data_model.g.dart';

@JsonSerializable()
class CartDataModel extends Equatable {
  @JsonKey(name: 'cart_items')
  final List<CartItemModel>? cartItems;
  @JsonKey(name: 'sub_total')
  final num? subTotal;
  final num? total;

  const CartDataModel({this.cartItems, this.subTotal, this.total});

  factory CartDataModel.fromJson(Map<String, dynamic> json) =>
      _$CartDataModelFromJson(json);
  toJson() => _$CartDataModelToJson(this);
  @override
  List<Object?> get props => [cartItems, subTotal, total];
}
