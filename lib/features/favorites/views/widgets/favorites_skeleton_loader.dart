import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/helpers/dummy_data.dart';
import 'favorites_list.dart';

class FavoritesSkeletonLoader extends StatelessWidget {
  const FavoritesSkeletonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Skeletonizer(
      enabled: true,
      child: FavoritesList(favorites: dummyFavoriteItems),
    );
  }
}
