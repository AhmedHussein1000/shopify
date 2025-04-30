import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/themes/app_styles.dart';
import '../view_models/carts_cubit/carts_cubit.dart';
import 'widgets/cart_items_list_bloc_builder.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Your cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Expanded(child: CartItemsListBlocBuilder()),
            _buildTotalPriceRow(context),
            const SizedBox(height: 8),
            _buildOrderButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalPriceRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Total Price:', style: Styles.styleSemiBold20(context)),
        BlocBuilder<CartsCubit, CartsState>(
          builder: (context, state) {
            if (state is CartsSuccess) {
              return Text(
                '\$${state.cartData.total!.toStringAsFixed(2)}',
                style: Styles.styleSemiBold20(context).copyWith(
                  color: Colors.green,
                ),
              );
            }
            return const Text('\$0.00');
          },
        ),
      ],
    );
  }

  Widget _buildOrderButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          //TODO
        },
        child: Text(
          'Order Now',
          style: Styles.styleSemiBold20(context),
        ),
      ),
    );
  }
}
