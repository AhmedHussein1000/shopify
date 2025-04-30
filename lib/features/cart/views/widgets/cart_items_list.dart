import 'package:flutter/material.dart';
import '../../models/cart_item_model.dart';
import '../../../../core/widgets/custom_divider.dart';
import 'cart_product_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.cartItems});
  final List<CartItemModel> cartItems;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: cartItems.length,
      separatorBuilder: (context, index) => const CustomDivider(),
      itemBuilder: (context, index) => CartProductItem(
       cartItem: cartItems[index],
      ),
    );
  }
}
