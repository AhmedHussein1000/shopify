import 'package:flutter/material.dart';
import '../../../../core/shared/models/products_response_models/product_model.dart';
import '../../../../core/widgets/grid_product_item.dart';

class HomeProducts extends StatelessWidget {
  const HomeProducts({super.key, required this.homeProducts});
  final List<ProductModel> homeProducts;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: homeProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1 / 1.45,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) => GridProductItem(
        product: homeProducts[index],
      ),
    );
  }
}
