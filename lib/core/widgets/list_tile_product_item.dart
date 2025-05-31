import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:shop_app/core/helpers/assets.dart';
import 'package:shop_app/core/helpers/extensions.dart';
import 'package:shop_app/features/product_details/views/product_details_view.dart';
import 'package:shop_app/core/themes/app_styles.dart';
import 'product_price_and_fav.dart';
import 'package:shop_app/core/shared/models/products_response_models/product_model.dart';

class ListTileProductItem extends StatelessWidget {
  const ListTileProductItem(
      {super.key,
      required this.product,
      this.showDiscount = true,
      this.isSearchView = false});
  final ProductModel product;
  final bool showDiscount;
  final bool isSearchView;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushPersistentScreen(ProductDetailsView(
        isSearchedProducts: isSearchView,
      )),
      child: ListTile(
        leading: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            CachedNetworkImage(
              width: 100,
              height: 100,
              imageUrl: product.image ?? "https://via.placeholder.com/150",
              placeholder: (context, url) =>
                  Image.asset(Assets.imagesBlueLoading),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            if (showDiscount && product.discount != 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                color: Colors.red,
                child: Text('DISCOUNT', style: Styles.styleRegular10(context)),
              ),
          ],
        ),
        title: Text(
          product.name ?? "",
          style: Styles.styleMedium16(context),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: ProductPriceAndFav(
          product: product,
          isSearchedProducts: isSearchView,
        ),
      ),
    );
  }
}
