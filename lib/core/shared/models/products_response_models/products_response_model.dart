import 'package:json_annotation/json_annotation.dart';
import 'products_data_model.dart';

part 'products_response_model.g.dart';

@JsonSerializable()
class ProductsResponseModel {
  final bool status;
  final String? message;
  @JsonKey(name: 'data')
  final ProductsDataModel? productsData;

  const ProductsResponseModel(
      {required this.status,
      required this.message,
      required this.productsData});

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseModelFromJson(json);
}
