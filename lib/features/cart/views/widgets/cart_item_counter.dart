import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_models/carts_cubit/carts_cubit.dart';
import '../../../../core/themes/app_styles.dart';

class CartItemCounter extends StatelessWidget {
  const CartItemCounter(
      {super.key, required this.cartId, required this.quantity});
  final int cartId;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            quantity > 1
                ? context
                    .read<CartsCubit>()
                    .updateCartItem(cartId: cartId, quantity: quantity - 1)
                : null;
          },
          icon: const Icon(
            Icons.remove,
            color: Colors.red,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          quantity.toString(),
          style: Styles.styleSemiBold20(context),
        ),
        const SizedBox(
          width: 10,
        ),
        IconButton(
          onPressed: () => context
              .read<CartsCubit>()
              .updateCartItem(cartId: cartId, quantity: quantity + 1),
          icon: const Icon(
            Icons.add,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
