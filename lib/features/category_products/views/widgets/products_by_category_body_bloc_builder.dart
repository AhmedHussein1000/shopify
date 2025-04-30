import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/dummy_data.dart';
import '../../../../core/widgets/custom_text_message.dart';
import '../../view_models/products_by_category_cubit/products_by_category_cubit.dart';
import 'products_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsByCategoryBlocBuilder extends StatefulWidget {
  const ProductsByCategoryBlocBuilder({super.key, required this.categoryId});
final int categoryId;
  @override
  State<ProductsByCategoryBlocBuilder> createState() => _ProductsByCategoryBlocBuilderState();
}

class _ProductsByCategoryBlocBuilderState extends State<ProductsByCategoryBlocBuilder> {
 @override
  void initState() {
    super.initState();
    context
        .read<ProductsByCategoryCubit>()
        .getProductsByCategory(categoryId: widget.categoryId);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsByCategoryCubit, ProductsByCategoryState>(
        builder: (context, state) {
      if (state is ProductsByCategoryFailure) {
        return CustomTextMessage(text: state.message);  
      } else if (state is ProductsByCategorySuccess) {
        return ProductsList(products: state.products);
      } else {
        return const Skeletonizer(
          enabled: true,
          child: ProductsList(products: dummyProducts),
        );
      }
    });
  }
}
