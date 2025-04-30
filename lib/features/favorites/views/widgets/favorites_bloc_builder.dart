import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_text_message.dart';
import '../../view_models/get_favorites_cubit/favorites_cubit.dart';
import 'favorites_list.dart';
import 'favorites_skeleton_loader.dart';

class FavoritesBlocBuilder extends StatelessWidget {
  const FavoritesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
        buildWhen: (previous, current) =>
            current is GetFavoritesSuccess ||
            current is GetFavoritesFailure ||
            current is GetFavoritesLoading,
        builder: (context, state) {
          if (state is GetFavoritesFailure) {
            return CustomTextMessage(text: state.message);
          } else if (state is GetFavoritesSuccess) {
            if (state.favorites.isEmpty) {
              return const CustomTextMessage(text: 'No favorites yet');
            }
            return FavoritesList(favorites: state.favorites);
          } else {
            return const FavoritesSkeletonLoader();
          }
        });
  }
}
