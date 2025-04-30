import 'package:flutter/material.dart';
import 'package:shop_app/features/addresses/models/address_model.dart';
import 'package:shop_app/features/addresses/views/widgets/address_item.dart';

class AddressesList extends StatelessWidget {
  const AddressesList({
    super.key,
    required this.addresses,
  });
  final List<AddressModel> addresses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: addresses.length,
      itemBuilder: (context, index) {
        return AddressItem(address: addresses[index]);
      },
    );
  }
}

