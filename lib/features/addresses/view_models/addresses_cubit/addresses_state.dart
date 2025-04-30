part of 'addresses_cubit.dart';

sealed class AddressesState extends Equatable {
  const AddressesState();

  @override
  List<Object> get props => [];
}

final class AddressesInitial extends AddressesState {}

final class AddressesLoading extends AddressesState {}

final class AddressesSuccess extends AddressesState {
  final List<AddressModel> addresses;
  const AddressesSuccess({required this.addresses});

  @override
  List<Object> get props => [addresses];
}

final class AddressesError extends AddressesState {
  final String message;
  const AddressesError({required this.message});

  @override
  List<Object> get props => [message];
}
