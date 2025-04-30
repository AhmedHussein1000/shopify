import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../core/shared/models/products_response_models/product_model.dart';
part 'cart_item_model.g.dart';

@JsonSerializable()
class CartItemModel extends Equatable {
  final int id;
  final int? quantity;
  final ProductModel? product;

  const CartItemModel({required this.id, this.quantity, this.product});

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);
  toJson() => _$CartItemModelToJson(this);
  @override
  List<Object?> get props => [id, quantity, product];
}
