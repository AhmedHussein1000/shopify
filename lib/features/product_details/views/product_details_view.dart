import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/functions/show_toast.dart';
import '../../cart/view_models/carts_cubit/carts_cubit.dart';
import '../view_models/product_details_cubit/product_details_cubit.dart';
import '../../../core/helpers/size_config.dart';
import '../../../core/themes/app_styles.dart';
import 'widgets/product_details_view_body_bloc_builder.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, this.productId, this.isSearchedProducts=false});
  final int? productId;
  final bool isSearchedProducts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CartButton(
        productId: productId!,
      ),
      appBar: AppBar(
        title: const Text('Shopify'),
      ),
      body: BlocProvider(
        create: (context) => ProductDetailsCubit(getIt())..getProductDetails(productId: productId!),
        child: ProductDetailsViewBodyBlocBuilder( isSearchedProducts: isSearchedProducts),
      ),
    );
  }
}

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
    required this.productId,
  });
  final int productId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 45,
        width: SizeConfig.screenWidth * 0.8,
        child: ElevatedButton(
          onPressed: () {
            context
                .read<CartsCubit>()
                .addOrRemoveCartItem(productId: productId);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                size: 20,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              const SizedBox(
                width: 10,
              ),
              BlocConsumer<CartsCubit, CartsState>(
                listener: (context, state) {
                  if (state is AddOrRemoveCartItemFailure) {
                    customToast(state.message, ToastStates.error);
                  }
                },
                builder: (context, state) {
                  return Text(
                      context
                              .read<CartsCubit>()
                              .cartProductsIds
                              .contains(productId)
                          ? 'Remove from cart'
                          : 'Add to cart',
                      style: Styles.styleSemiBold20(context));
                },
              ),
            ],
          ),
        ));
  }
}
