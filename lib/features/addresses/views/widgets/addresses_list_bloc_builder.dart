import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/helpers/dummy_data.dart';
import 'package:shop_app/core/widgets/custom_text_message.dart';
import 'package:shop_app/features/addresses/view_models/addresses_cubit/addresses_cubit.dart';
import 'package:shop_app/features/addresses/views/widgets/addresses_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AddressesListBlocBuilder extends StatelessWidget {
  const AddressesListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressesCubit, AddressesState>(
      builder: (context, state) {
        if (state is AddressesSuccess) {
          return AddressesList(addresses: state.addresses);
        } else if (state is AddressesError) {
          return CustomTextMessage(text: state.message);
        } 
          return const Skeletonizer(child:  AddressesList(addresses: dummyAddresses));
        
      },
    );
  }
}
