import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'favorite_product_model.dart';
part 'favorite_item_model.g.dart';

@JsonSerializable()
class FavoriteItemModel extends Equatable {
  final int id;
  final FavoriteProductModel? product;

  const FavoriteItemModel({required this.id, this.product});

  factory FavoriteItemModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteItemModelFromJson(json);
  toJson() => _$FavoriteItemModelToJson(this);
  @override
  List<Object?> get props => [id];
}
