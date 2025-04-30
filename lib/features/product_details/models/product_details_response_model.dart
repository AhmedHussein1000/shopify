import 'package:json_annotation/json_annotation.dart';
import '../../../core/shared/models/products_response_models/product_model.dart';
part 'product_details_response_model.g.dart';

@JsonSerializable()
class ProductDetailsResponseModel {
  final bool status;
  final String? message;
  @JsonKey(name: 'data')
  final ProductModel product;

  const ProductDetailsResponseModel(
      {required this.status, required this.message, required this.product});

  factory ProductDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponseModelFromJson(json);
}
