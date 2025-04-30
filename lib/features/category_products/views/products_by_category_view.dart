import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/service_locator.dart';
import '../view_models/products_by_category_cubit/products_by_category_cubit.dart';
import 'widgets/products_by_category_body_bloc_builder.dart';

class CategoryProductsView extends StatelessWidget {
  const CategoryProductsView({super.key,required this.categoryId});
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsByCategoryCubit(getIt()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Shopify'),
        ),
        body:  ProductsByCategoryBlocBuilder(categoryId: categoryId,),
      ),
    );
  }
}
