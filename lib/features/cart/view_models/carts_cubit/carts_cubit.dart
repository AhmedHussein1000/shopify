import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../models/cart_data_model.dart';
import '../../repository/base_cart_repo.dart';

part 'carts_state.dart';

class CartsCubit extends HydratedCubit<CartsState> {
  final BaseCartRepo baseCartRepo;
  CartsCubit(this.baseCartRepo) : super(CartsInitial());
  final Set<int> cartProductsIds = {};
  Future<void> getCarts() async {
    final result = await baseCartRepo.getCarts();
    result.fold(
      (failure) => emit(CartsFailure(message: failure.message)),
      (cartsData) {
        cartProductsIds.clear();
        cartProductsIds.addAll(cartsData.cartItems!.map(
          (e) => e.product!.id,
        ));
        emit(CartsSuccess(cartData: cartsData));
      },
    );
  }

  Future<void> addOrRemoveCartItem({
    required int productId,
  }) async {
    final bool wasInCart = cartProductsIds.contains(productId);
    wasInCart
        ? cartProductsIds.remove(productId)
        : cartProductsIds.add(productId);
    emit(AddOrRemoveCartItemSuccess());
    final result = await baseCartRepo.addOrRemoveCart(productId: productId);
    result.fold(
      (failure) {
        wasInCart
            ? cartProductsIds.add(productId)
            : cartProductsIds.remove(productId);
        emit(AddOrRemoveCartItemFailure(message: failure.message));
      },
      (r) => getCarts(),
    );
  }

  Future<void> deleteCartItem({required int cartId}) async {
    final result = await baseCartRepo.deleteCart(cartId: cartId);
    result.fold(
        (failure) => emit(DeleteCartItemFailure(message: failure.message)),
        (r) => getCarts());
  }

  Future<void> updateCartItem(
      {required int cartId, required int quantity}) async {
    final result = await baseCartRepo.changeCartQuantity(
        cartId: cartId, quantity: quantity);
    result.fold(
        (failure) => emit(CartItemUpdateFailure(message: failure.message)),
        (updatedItem) => getCarts());
  }

  @override
  CartsState? fromJson(Map<String, dynamic> json) {
    return CartsSuccess(cartData: CartDataModel.fromJson(json['cartData']));
  }

  @override
  Map<String, dynamic>? toJson(CartsState state) {
    if (state is CartsSuccess) {
      return {'cartData': state.cartData.toJson()};
    }
    return null;
  }
}
