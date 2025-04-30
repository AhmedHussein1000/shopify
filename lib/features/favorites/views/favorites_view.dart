import 'package:flutter/material.dart';
import 'widgets/favorites_bloc_builder.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopify'),
      ),
      body: const FavoritesBlocBuilder(),
    );
  }
}
