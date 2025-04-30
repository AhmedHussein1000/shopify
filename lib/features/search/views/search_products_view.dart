import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/search/view_models/bloc/search_products_bloc.dart';
import '../../../core/di/service_locator.dart';
import 'widgets/search_products_view_body.dart';

class SearchProductsView extends StatelessWidget {
  const SearchProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchProductsBloc(getIt()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search Products'),
        ),
        body: const SearchProductsViewBody(),
      ),
    );
  }
}
