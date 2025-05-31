import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/helpers/dummy_data.dart';
import '../../../../core/widgets/custom_text_message.dart';
import '../../view_models/product_details_cubit/product_details_cubit.dart';
import 'product_details_view_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductDetailsViewBodyBlocBuilder extends StatelessWidget {
  const ProductDetailsViewBodyBlocBuilder({
    super.key,
    required this.isSearchedProducts,
  });

  final bool? isSearchedProducts;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        if (state is ProductDetailsFailure) {
          return CustomTextMessage(text: state.message);
        } else if (state is ProductDetailsSuccess) {
          return ProductDetailsViewBody(
              product: state.product,
              isSearchedProducts: isSearchedProducts);
        } else {
          return Skeletonizer(
            enabled: true,
            child: ProductDetailsViewBody(
                product: dummyProduct,
                isSearchedProducts: isSearchedProducts),
          );
        }
      },
    );
  }
}
