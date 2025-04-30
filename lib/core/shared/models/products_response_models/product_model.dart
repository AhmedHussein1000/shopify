import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends Equatable {
  final int id;
  final num? price;
  @JsonKey(name: 'old_price')
  final num? oldPrice;
  final int? discount;
  final String? image;
  final String? name;
  final String? description;
  final List<String>? images;
  @JsonKey(name: 'in_favorites')
  final bool? inFavorites;
  @JsonKey(name: 'in_cart')
  final bool? inCart;

  const ProductModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  toJson() => _$ProductModelToJson(this);
  @override
  List<Object?> get props {
    return [id];
  }
}
