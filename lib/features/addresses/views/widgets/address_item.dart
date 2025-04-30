import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/helpers/extensions.dart';
import 'package:shop_app/features/addresses/models/address_model.dart';
import 'package:shop_app/features/addresses/view_models/addresses_cubit/addresses_cubit.dart';
import 'package:shop_app/features/addresses/views/edit_address_view.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({
    super.key,
    required this.address,
  });

  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(address.name!),
            Text('${address.city}, ${address.region}'),
            Text(address.details!),
            Text(address.notes!),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                context.pushPersistentScreen(
                  BlocProvider.value(
                    value: context.read<AddressesCubit>(),
                    child: EditAddressView(address: address),
                  ),
                  withNavBar: false,
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                context
                    .read<AddressesCubit>()
                    .deleteAddress(address.id.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
