import 'package:flutter/material.dart';
import '../../../../core/themes/app_colors.dart';
import '../../models/favorites_model/favorite_item_model.dart';
import 'favorite_product_item.dart';

class FavoritesList extends StatelessWidget {
  final List<FavoriteItemModel> favorites;

  const FavoritesList({required this.favorites, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        color: AppColors.grey,
        height: 40,
      ),
      itemCount: favorites.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => FavoriteProductItem(
        favoriteProduct: favorites[index].product!,
      ),
    );
  }
}
