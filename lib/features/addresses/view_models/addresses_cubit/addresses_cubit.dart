import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/features/addresses/models/address_model.dart';
import 'package:shop_app/features/addresses/models/address_request_body_model.dart';
import 'package:shop_app/features/addresses/repository/base_addresses_repo.dart';

part 'addresses_state.dart';

class AddressesCubit extends Cubit<AddressesState> {
  final BaseAddressesRepo baseAddressesRepo;
  AddressesCubit(this.baseAddressesRepo) : super(AddressesInitial());

  Future<void> addAddress(
      {required AddressRequestBodyModel addressRequestBody}) async {
    emit(AddressesLoading());
    final result = await baseAddressesRepo.addAddress(
        addressRequestBody: addressRequestBody);
    result.fold((failure) => emit(AddressesError(message: failure.message)),
        (_) => getAddresses());
  }

  Future<void> updateAddress(AddressModel address) async {
    emit(AddressesLoading());
    final result = await baseAddressesRepo.updateAddress(
      address: address,
    );
    result.fold((failure) => emit(AddressesError(message: failure.message)),
        (_) => getAddresses());
  }

  Future<void> deleteAddress(String addressId) async {
    final result =
        await baseAddressesRepo.deleteAddress(addressId: int.parse(addressId));
    result.fold((failure) => emit(AddressesError(message: failure.message)),
        (_) => getAddresses());
  }

  Future<void> getAddresses() async {
    emit(AddressesLoading());
    final result = await baseAddressesRepo.getAddresses();
    result.fold((failure) => emit(AddressesError(message: failure.message)),
        (addresses) => emit(AddressesSuccess(addresses: addresses)));
  }
}
