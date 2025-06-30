import 'package:bloc/bloc.dart';
import 'package:finalproject_nti/feature/cart/model/cart_data.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartData cartData = CartData();
  List cartlist=[];

  addCart(String id) async {
    emit(CartLoadingState());
      var fav= await cartData.addCart(id);
      emit(CartSuccessAddState(fav));
  }

  getCart() async {
    emit(CartLoadingState());
    cartlist= await cartData.getCart();
    emit(CartSuccessGetState(cartlist));
    
  }

  deleteCart(String id) async {
    emit(CartLoadingState());
    var fav= await cartData.deleteCart(id);
    emit(CartSuccessDeleteState(fav));
    getCart();
  }

}
