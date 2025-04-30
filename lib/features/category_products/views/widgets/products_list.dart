import 'package:flutter/material.dart';
import '../../../../core/shared/models/products_response_models/product_model.dart';
import '../../../../core/widgets/grid_product_item.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key, required this.products});
final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
          itemCount:products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1.45,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) => GridProductItem(
            product: products[index],
          ),
        );
  }
}