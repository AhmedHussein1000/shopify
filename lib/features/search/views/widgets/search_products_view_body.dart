import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/search/view_models/bloc/search_products_bloc.dart';
import '../../../../core/themes/app_colors.dart';
import 'searched_products_list_bloc_builder.dart';

class SearchProductsViewBody extends StatefulWidget {
  const SearchProductsViewBody({super.key});

  @override
  State<SearchProductsViewBody> createState() => _SearchProductsViewBodyState();
}

class _SearchProductsViewBodyState extends State<SearchProductsViewBody> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            cursorColor: AppColors.bluePrimaryColor,
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Search...',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              context
                  .read<SearchProductsBloc>()
                  .add(SearchProductEvent(value));
            },
          ),
        ),
        const Expanded(
          child: SearchedProductsListBlocBuilder(),
        ),
      ],
    );
  }
}
