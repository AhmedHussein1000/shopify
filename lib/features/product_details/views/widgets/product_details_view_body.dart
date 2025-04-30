import 'package:flutter/material.dart';
import '../../../../core/shared/models/products_response_models/product_model.dart';
import 'product_images_page_view.dart';
import '../../../../core/widgets/custom_divider.dart';
import '../../../../core/widgets/product_price_and_fav.dart';
import '../../../../core/themes/app_styles.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({
    super.key,
    required this.product,
    required this.isSearchedProducts,
  });

  final ProductModel? product;
  final bool? isSearchedProducts;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product!.name ?? '',
              style: Styles.styleMedium18(context),
            ),
            const SizedBox(
              height: 20,
            ),
            ProductImagesPageView(
              images: product!.images ?? [],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ProductPriceAndFav(
                isSearchedProducts: isSearchedProducts ?? false,
                product: product!,
              ),
            ),
            const CustomDivider(
              height: 40,
              thickness: 1,
            ),
            Text(
              'Description',
              style: Styles.styleSemiBold20(context),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              product!.description ?? '',
              style: Styles.styleRegular18(context),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
