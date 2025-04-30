import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/service_locator.dart';
import '../view_models/categories_cubit/categories_cubit.dart';
import 'widgets/categories_list_bloc_builder.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false, title: const Text(' Shopify ')),
        body: BlocProvider(
          create: (context) => CategoriesCubit(getIt())..getCategories(),
          child: const CategoriesListBlocBuilder(),
        ));
  }
}
