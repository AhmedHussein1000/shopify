import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/helpers/extensions.dart';
import 'package:shop_app/features/product_details/views/product_details_view.dart';
import 'package:shop_app/core/helpers/assets.dart';
import 'product_price_and_fav.dart';
import 'package:shop_app/core/themes/app_styles.dart';
import 'package:shop_app/core/shared/models/products_response_models/product_model.dart';

class GridProductItem extends StatelessWidget {
  const GridProductItem(
      {super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>  context.pushPersistentScreen(ProductDetailsView(
        product: product,) ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1),
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                product.image != null
                    ? CachedNetworkImage(
                        width: double.infinity,
                        height: 100,
                        imageUrl: product.image!,
                        placeholder: (context, url) => Image.asset(
                            Assets.imagesBlueLoading),
                        errorWidget: (context, url, error) => const Icon(Icons.error),    
                        )
                    : Image.asset(Assets.imagesNoProductImage),
                if (product.discount != 0)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    color: Colors.red,
                    child:
                        Text('DISCOUNT', style: Styles.styleRegular10(context)),
                  ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              product.name ?? "",
              style: Styles.styleMedium16(context),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            ProductPriceAndFav(
              product: product,
            )
          ],
        ),
      ),
    );
  }
}
