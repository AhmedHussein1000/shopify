import 'package:flutter/material.dart';
import '../../../../core/shared/models/products_response_models/product_model.dart';
import '../../../../core/themes/app_styles.dart';
import '../../models/home_model/banner_model.dart';
import 'home_banners.dart';
import 'home_products.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    required this.banners,
    required this.homeProducts,
  });
  final List<BannerModel> banners;
  final List<ProductModel> homeProducts;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeBanners(
              banners: banners,
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Popular Products',
                style: Styles.styleSemiBold24(context),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
      HomeProducts(
        homeProducts: homeProducts,
      )
    ]);
  }
}
