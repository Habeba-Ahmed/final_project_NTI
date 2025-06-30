part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class CartLoadingState extends CartState {}
final class CartSuccessGetState extends CartState {
  final cartList;
  CartSuccessGetState(this.cartList);
}
final class CartSuccessAddState extends CartState {
  final cartList;
  CartSuccessAddState(this.cartList);
}
final class CartSuccessDeleteState extends CartState {
  final cartList;
  CartSuccessDeleteState(this.cartList);
}
final class CartSuccessUpdateState extends CartState {
  final cartList;
  CartSuccessUpdateState(this.cartList);
}
final class CartFailedState extends CartState {}

