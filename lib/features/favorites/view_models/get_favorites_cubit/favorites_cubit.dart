import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../../../core/repos/products_repos/base_products_repo.dart';
import '../../models/favorites_model/favorite_item_model.dart';

part 'favorites_state.dart';

class FavoritesCubit extends HydratedCubit<FavoritesState> {
  final BaseProductsRepo baseProductsRepo;
  FavoritesCubit(this.baseProductsRepo) : super(GetFavoritesInitial());

  final Set<int> favoriteProductsIds = {};

  Future<void> getFavorites() async {
    emit(GetFavoritesLoading());
    final result = await baseProductsRepo.getFavorites();
    result.fold(
      (failure) => emit(GetFavoritesFailure(failure.message)),
      (favoritesItems) {
        favoriteProductsIds.clear();
        favoriteProductsIds.addAll(favoritesItems.map((e) => e.product!.id));
        emit(GetFavoritesSuccess(favoritesItems));
      },
    );
  }

  Future<void> toggleFavorite({required int productId}) async {
    final bool wasFavorite = favoriteProductsIds.contains(productId);

    wasFavorite
        ? favoriteProductsIds.remove(productId)
        : favoriteProductsIds.add(productId);

    emit(const AddOrRemoveFavoriteSuccess());
    final result =
        await baseProductsRepo.addOrRemoveFavorite(productId: productId);

    result.fold(
      (failure) {
        wasFavorite
            ? favoriteProductsIds.add(productId)
            : favoriteProductsIds.remove(productId);
        emit(AddOrRemoveFavoriteFailure(message: failure.message));
      },
      (r) {
        getFavorites();
      },
    );
  }

  @override
  FavoritesState? fromJson(Map<String, dynamic> json) {
    return GetFavoritesSuccess((json['favorites'] as List)
        .map(
          (e) => FavoriteItemModel.fromJson(e),
        )
        .toList());
  }

  @override
  Map<String, dynamic>? toJson(FavoritesState state) {
    if (state is GetFavoritesSuccess) {
      return {
        'favorites': state.favorites.map(
          (e) => e.toJson(),
        ).toList()
      };
    }
    return null;
  }
}
