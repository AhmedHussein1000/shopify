import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/dummy_data.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/widgets/custom_text_message.dart';
import '../../view_models/carts_cubit/carts_cubit.dart';
import 'cart_items_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartItemsListBlocBuilder extends StatelessWidget {
  const CartItemsListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartsCubit, CartsState>(
      buildWhen: (previous, current) =>
          current is CartsFailure ||
          current is CartsSuccess,
      builder: (context, state) {
        if (state is CartsSuccess) {
          return state.cartData.cartItems.isNullOrEmpty()
              ? const CustomTextMessage(text: 'Your Cart is Empty')
              : CartItemsList(
                  cartItems: state.cartData.cartItems!,
                );
        } else if (state is CartsFailure) {
          return CustomTextMessage(text: state.message);
        }
        return const SizedBox.shrink();
      
      },
    );
  }
}
