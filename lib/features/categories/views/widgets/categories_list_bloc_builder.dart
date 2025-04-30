import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/dummy_data.dart';
import '../../../../core/widgets/custom_text_message.dart';
import '../../view_models/categories_cubit/categories_cubit.dart';
import 'categories_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesListBlocBuilder extends StatelessWidget {
  const CategoriesListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesFailure) {
          return CustomTextMessage(text: state.message);
        } else if (state is CategoriesSuccess) {
          return CategoriesList(categories: state.categories);
        } else {
          return Skeletonizer(
            enabled: true,
              child: CategoriesList(categories: dummyCategories));
        }
      },
    );
  }
}
