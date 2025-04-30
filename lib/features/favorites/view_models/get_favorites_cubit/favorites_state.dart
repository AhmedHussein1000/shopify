part of 'favorites_cubit.dart';

sealed class FavoritesState extends Equatable {
  const FavoritesState();
  
  @override
  List<Object?> get props => [];
}

final class GetFavoritesInitial extends FavoritesState {}

final class GetFavoritesLoading extends FavoritesState {}

final class GetFavoritesSuccess extends FavoritesState {
  final List<FavoriteItemModel> favorites;
  const GetFavoritesSuccess(this.favorites);

  @override
  List<Object?> get props => [favorites];
}

final class GetFavoritesFailure extends FavoritesState {
  final String message;
  const GetFavoritesFailure(this.message);
}

// add or remove favorite
final class AddOrRemoveFavoriteSuccess extends FavoritesState {
  

  const AddOrRemoveFavoriteSuccess();
}

final class AddOrRemoveFavoriteFailure extends FavoritesState {
  final String message;
  
  const AddOrRemoveFavoriteFailure(
      {required this.message});
}
