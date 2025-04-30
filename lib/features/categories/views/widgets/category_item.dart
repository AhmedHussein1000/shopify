import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/assets.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routes/routes.dart';
import '../../../favorites/view_models/get_favorites_cubit/favorites_cubit.dart';
import '../../../../core/themes/app_styles.dart';
import '../../../../core/utils/constants.dart';
import '../../models/categories_model/category_model.dart';
import '../../../category_products/views/products_by_category_view.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushPersistentScreen(CategoryProductsView(categoryId: category.id))
      ,
      child: ListTile(
        leading: CachedNetworkImage(
          imageUrl: category.image ?? AppConstants.defaultCategoryURL,
          placeholder: (context, url) => Image.asset(Assets.imagesBlueLoading),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.cover,
          width: 100,
        ),
        title: Text(
          category.name ?? '',
          style: Styles.styleSemiBold20(context),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
