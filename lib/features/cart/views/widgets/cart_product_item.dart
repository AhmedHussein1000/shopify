import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/cart_item_model.dart';
import '../../view_models/carts_cubit/carts_cubit.dart';
import 'package:shop_app/core/widgets/list_tile_product_item.dart';
import 'cart_item_counter.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem(
      {super.key, required this.cartItem});
  final CartItemModel cartItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTileProductItem(product: cartItem.product!),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CartItemCounter(
              cartId: cartItem.id,
              quantity: cartItem.quantity!,
            ),
            IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () => context
                  .read<CartsCubit>()
                  .deleteCartItem(cartId: cartItem.id),
            )
          ],
        )
      ],
    );
  }
}
