import 'package:bloc/bloc.dart';
import 'package:finalproject_nti/feature/favorite/cubit/fav_state.dart';
import 'package:finalproject_nti/feature/favorite/model/fav_data.dart';

class FavCubit extends Cubit<FavState>{
  FavCubit() : super(FavInitialState());
FavData favData = FavData();
List favlist=[];
  addFavorite(String id) async {
    emit(FavLoadingState());
      var fav= await favData.addFavorite(id);
      emit(FavSuccessAddState(favList: fav));
  }

  getFavorites() async {
    emit(FavLoadingState());
    favlist= await favData.getFavorites();
    emit(FavSuccessGetState(favList: favlist));
    
  }

  deleteFavorites(String id) async {
    emit(FavLoadingDeleteState());
    var fav= await favData.deleteFavorites(id);
    emit(FavSuccessDeleteState(favList: fav));
    getFavorites();
    
  }


}