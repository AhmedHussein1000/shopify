import 'package:json_annotation/json_annotation.dart';
import 'category_model.dart';
part 'categories_data_model.g.dart';

@JsonSerializable()
class CategoriesDataModel {
  @JsonKey(name: 'data')
  final List<CategoryModel>? categoriesList;

  const CategoriesDataModel({required this.categoriesList});

  factory CategoriesDataModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesDataModelFromJson(json);
}
