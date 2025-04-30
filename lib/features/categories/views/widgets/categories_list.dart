import 'package:flutter/material.dart';
import '../../../../core/themes/app_colors.dart';
import '../../models/categories_model/category_model.dart';
import 'category_item.dart';


class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key, required this.categories});
  final List<CategoryModel> categories;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        color: AppColors.grey,
        height: 40,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) =>
          CategoryItem(category: categories[index]),
    );
  }
}
