import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/search/view_models/bloc/search_products_bloc.dart';
import '../../../../core/widgets/custom_divider.dart';
import '../../../../core/helpers/dummy_data.dart';
import '../../../../core/widgets/custom_text_message.dart';
import '../../../../core/widgets/list_tile_product_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchedProductsListBlocBuilder extends StatelessWidget {
  const SearchedProductsListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchProductsBloc, SearchProductsState>(
      builder: (context, state) {
        if (state is SearchProductsSuccess) {
          if (state.products.isEmpty) {
            return const CustomTextMessage(text: 'No products found');
          }
          return ListView.separated(
            separatorBuilder: (context, index) => const CustomDivider(
              height: 30,
            ),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return ListTileProductItem(
                product: state.products[index],
                showDiscount: false,
                isSearchView: true,
              );
            },
          );
        } else if (state is SearchProductsFailure) {
          return CustomTextMessage(text: state.message);
        } else if (state is SearchProductsLoading) {
          return Skeletonizer(
            enabled: true,
            child: ListView.separated(
              separatorBuilder: (context, index) => const CustomDivider(
                height: 30,
              ),
              itemCount: dummyProducts.length,
              itemBuilder: (context, index) {
                return ListTileProductItem(
                  product: dummyProducts[index],
                  showDiscount: false,
                  isSearchView: true,
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
