import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/functions/show_toast.dart';
import 'package:shop_app/core/helpers/extensions.dart';
import 'package:shop_app/core/widgets/custom_circular_progress_indicator.dart';
import 'package:shop_app/features/addresses/models/address_model.dart';
import 'package:shop_app/features/addresses/view_models/addresses_cubit/addresses_cubit.dart';

class EditAddressButtonBlocConsumer extends StatelessWidget {
  const EditAddressButtonBlocConsumer({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.addressId,
    required TextEditingController nameController,
    required TextEditingController cityController,
    required TextEditingController regionController,
    required TextEditingController detailsController,
    required TextEditingController notesController,
  })  : _formKey = formKey,
        _nameController = nameController,
        _cityController = cityController,
        _regionController = regionController,
        _detailsController = detailsController,
        _notesController = notesController;

  final GlobalKey<FormState> _formKey;
  final int addressId;
  final TextEditingController _nameController;
  final TextEditingController _cityController;
  final TextEditingController _regionController;
  final TextEditingController _detailsController;
  final TextEditingController _notesController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressesCubit, AddressesState>(
      listener: (context, state) {
        if (state is AddressesSuccess) {
          customToast('Address has updated successfully', ToastStates.success);
          context.pop();
        }
        if (state is AddressesError) {
          customToast(state.message, ToastStates.error);
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
                      context.read<AddressesCubit>().updateAddress(AddressModel(
                          id: addressId,
                          name: _nameController.text,
                          city: _cityController.text,
                          region: _regionController.text,
                          details: _detailsController.text,
                          notes: _notesController.text));
                    }
                  },
                  child: const Text('Save Changes'),
                ),
              );
      },
    );
  }
}
