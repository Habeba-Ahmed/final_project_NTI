
sealed class FavState {}

class FavInitialState extends FavState {}

class FavLoadingState extends FavState {}

class FavSuccessAddState extends FavState {
  final  favList;

  FavSuccessAddState({required this.favList});
}

class FavSuccessGetState extends FavState {
  final favList;

  FavSuccessGetState({required this.favList});
}

class FavLoadingDeleteState extends FavState {}

class FavSuccessDeleteState extends FavState {
  final  favList;

  FavSuccessDeleteState({required this.favList});
}

class FavFailedState extends FavState {}
