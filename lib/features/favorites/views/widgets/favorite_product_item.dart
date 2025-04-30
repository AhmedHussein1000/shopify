import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/assets.dart';
import '../../../../core/widgets/product_price_and_fav.dart';
import '../../../../core/themes/app_styles.dart';
import '../../models/favorites_model/favorite_product_model.dart';

class FavoriteProductItem extends StatelessWidget {
  const FavoriteProductItem({super.key, required this.favoriteProduct});
  final FavoriteProductModel favoriteProduct;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          CachedNetworkImage(
              width: 100,
              height: 100,
              imageUrl:
                  favoriteProduct.image ?? "https://via.placeholder.com/150",
                    placeholder: (context, url) => Image.asset(
                            Assets.imagesBlueLoading),
                        errorWidget: (context, url, error) => const Icon(Icons.error), ),
          if (favoriteProduct.discount != 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              color: Colors.red,
              child: Text('DISCOUNT', style: Styles.styleRegular10(context)),
            ),
        ],
      ),
      title: Text(
        favoriteProduct.name ?? "",
        style: Styles.styleMedium16(context),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: ProductPriceAndFav(favoriteProduct: favoriteProduct),
    );
  }
}
