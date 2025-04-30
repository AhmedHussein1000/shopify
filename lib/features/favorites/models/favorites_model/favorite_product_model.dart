import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'favorite_product_model.g.dart';

@JsonSerializable()
class FavoriteProductModel extends Equatable {
  final int id;
  final int? price;
  @JsonKey(name: 'old_price')
  final int? oldPrice;
  final int? discount;
  final String? image;
  final String? name;
  final String? description;

  const FavoriteProductModel({
    required this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
  });

  factory FavoriteProductModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteProductModelFromJson(json);
  toJson() => _$FavoriteProductModelToJson(this);
  @override
  List<Object?> get props {
    return [id];
  }
}
