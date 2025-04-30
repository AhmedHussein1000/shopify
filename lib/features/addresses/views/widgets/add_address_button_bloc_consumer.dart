import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/functions/show_toast.dart';
import 'package:shop_app/core/helpers/extensions.dart';
import 'package:shop_app/core/widgets/custom_circular_progress_indicator.dart';
import 'package:shop_app/features/addresses/models/address_request_body_model.dart';
import 'package:shop_app/features/addresses/view_models/addresses_cubit/addresses_cubit.dart';

class AddAddressButtonBlocConsumer extends StatelessWidget {
  const AddAddressButtonBlocConsumer({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.nameController,
    required this.cityController,
    required this.regionController,
    required this.detailsController,
    required this.notesController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController nameController;
  final TextEditingController cityController;
  final TextEditingController regionController;
  final TextEditingController detailsController;
  final TextEditingController notesController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressesCubit, AddressesState>(
      listener: (context, state) {
        if (state is AddressesError) {
          customToast(state.message, ToastStates.error);
        }
        if (state is AddressesSuccess) {
          customToast('Address has added successfully',
              ToastStates.success);
          context.pop();
        }
      },
      builder: (context, state) {
        return state is AddressesLoading
            ? const CustomCircularProgressIndicator()
            : SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AddressesCubit>().addAddress(
                              addressRequestBody:
                                  AddressRequestBodyModel(
                            name: nameController.text,
                            city: cityController.text,
                            region: regionController.text,
                            details: detailsController.text,
                            notes: notesController.text,
                          ));
                    }
                  },
                  child: const Text('Add Address'),
                ),
              );
      },
    );
  }
}
