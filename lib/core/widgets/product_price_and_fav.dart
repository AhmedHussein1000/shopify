import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../functions/show_toast.dart';
import '../../features/favorites/models/favorites_model/favorite_product_model.dart';
import '../../features/favorites/view_models/get_favorites_cubit/favorites_cubit.dart';
import '../themes/app_colors.dart';
import '../themes/app_styles.dart';
import '../shared/models/products_response_models/product_model.dart';

class ProductPriceAndFav extends StatelessWidget {
  const ProductPriceAndFav({
    super.key,
    this.product,
    this.favoriteProduct,
    this.isSearchedProducts = false,
  }) : assert(product != null || favoriteProduct != null);

  final ProductModel? product;
  final FavoriteProductModel? favoriteProduct;
  final bool isSearchedProducts;

  int? get productId => product?.id ?? favoriteProduct?.id;
  num? get price => product?.price ?? favoriteProduct?.price;
  num? get oldPrice => product?.oldPrice ?? favoriteProduct?.oldPrice;
  int? get discount => product?.discount ?? favoriteProduct?.discount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(text: 'EGP', style: Styles.styleRegular14(context)),
              TextSpan(
                  text: ' ${price?.round()}',
                  style: Styles.styleMedium20(context)
                      .copyWith(color: AppColors.bluePrimaryColor)),
            ])),
            if (discount != 0 && !isSearchedProducts)
              Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: '${oldPrice?.round()}',
                      style: Styles.styleMedium18(context).copyWith(
                          color: Colors.grey.withAlpha((0.6 * 255).toInt()),
                          decoration: TextDecoration.lineThrough),
                    ),
                    TextSpan(
                        text: ' $discount%',
                        style: Styles.styleMedium16(context)
                            .copyWith(color: Colors.red)),
                  ]))
                ],
              ),
          ],
        ),
        IconButton(
            onPressed: () {
              context
                  .read<FavoritesCubit>()
                  .toggleFavorite(productId: productId!);
            },
            icon: BlocConsumer<FavoritesCubit, FavoritesState>(
              buildWhen: (previous, current) =>
                  current is AddOrRemoveFavoriteSuccess ||
                  current is AddOrRemoveFavoriteFailure,
              listener: (context, state) {
                if (state is AddOrRemoveFavoriteFailure) {
                  customToast(state.message, ToastStates.error);
                }
              },
              builder: (context, state) {
                final bool isFavorite = context
                    .read<FavoritesCubit>()
                    .favoriteProductsIds
                    .contains(productId);
                return Icon(
                  Icons.favorite,
                  color: isFavorite
                      ? AppColors.bluePrimaryColor
                      : Colors.grey.shade400,
                );
              },
            )),
      ],
    );
  }
}
