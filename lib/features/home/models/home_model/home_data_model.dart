import 'package:json_annotation/json_annotation.dart';

import 'banner_model.dart';
import '../../../../core/shared/models/products_response_models/product_model.dart';
part 'home_data_model.g.dart';

@JsonSerializable()
class HomeDataModel {
  final List<BannerModel>? banners;
  final List<ProductModel>? products;

  const HomeDataModel({
    required this.banners,
    required this.products,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) =>
      _$HomeDataModelFromJson(json);
}
