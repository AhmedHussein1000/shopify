import 'package:json_annotation/json_annotation.dart';
import 'product_model.dart';

part 'products_data_model.g.dart';

@JsonSerializable()
class ProductsDataModel {
  @JsonKey(name: 'data')
  final List<ProductModel>? products;

  const ProductsDataModel({
    required this.products,
  });

  factory ProductsDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsDataModelFromJson(json);
}
