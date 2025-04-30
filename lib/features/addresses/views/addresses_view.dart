import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/helpers/extensions.dart';
import 'package:shop_app/features/addresses/view_models/addresses_cubit/addresses_cubit.dart';
import 'package:shop_app/features/addresses/views/add_address_view.dart';
import 'package:shop_app/features/addresses/views/widgets/addresses_list_bloc_builder.dart';

class AddressesView extends StatefulWidget {
  const AddressesView({super.key});

  @override
  State<AddressesView> createState() => _AddressesViewState();
}

class _AddressesViewState extends State<AddressesView> {
  @override
  void initState() {
    context.read<AddressesCubit>().getAddresses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Addresses'),
      ),
      body: const AddressesListBlocBuilder(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushPersistentScreen(const AddAddressView()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
