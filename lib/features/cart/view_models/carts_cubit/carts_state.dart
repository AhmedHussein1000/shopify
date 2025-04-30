part of 'carts_cubit.dart';

sealed class CartsState extends Equatable {
  const CartsState();

  @override
  List<Object?> get props => [];
}

final class CartsInitial extends CartsState {}
final class CartsSuccess extends CartsState {
  final CartDataModel cartData;
  const CartsSuccess({required this.cartData});

  @override
  List<Object?> get props => [cartData];
}

final class CartsFailure extends CartsState {
  final String message;
  const CartsFailure({
    required this.message,
  });
}

final class AddOrRemoveCartItemSuccess extends CartsState {}

final class AddOrRemoveCartItemFailure extends CartsState {
  final String message;
  const AddOrRemoveCartItemFailure({
    required this.message,
  });
}

final class DeleteCartItemFailure extends CartsState {
  final String message;
  const DeleteCartItemFailure({
    required this.message,
  });
}

final class CartItemUpdateFailure extends CartsState {
  final String message;
  const CartItemUpdateFailure({required this.message});
}
